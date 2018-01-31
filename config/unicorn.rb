app_path = "/home/pi/okisoft/OTSystem"

worker_processes 4
timeout 15
preload_app true

listen "/tmp/sockets/unicorn.sock"
pid "/tmp/pids/unicorn.pid"

stderr_path "#{app_path}/log/unicorn.log"
stdout_path "#{app_path}/log/unicorn.log"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/current/Gemfile"
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
  Signal.trap 'TERM' do
    puts 'Unicorn master interceptiong TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

class Progress < ApplicationRecord
  belongs_to :lecture_time
  belongs_to :user
  belongs_to :group
end

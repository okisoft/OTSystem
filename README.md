[![Build Status](https://travis-ci.org/okisoft/OTSystem.svg?branch=develop)](https://travis-ci.org/okisoft/OTSystem)

# OTSystem

### 初期設定

* `ruby -v`でruby のバージョンが`2.4.3`であるかを確認する

* bundler のインストール

```
$ gem install bundler
```

* Gemfileがあるレポジトリで以下を実行

```
$ bundle install --path vendor/bundle
```

* 正しく動いているかの確認

```
$ bundle exec rails s
```

* JQueryの導入

  1. `npm`または`brew`で`yarn`をインストールする
  ```
  # Homebrewから
  $ brew install yarn
  # npmから
  $ npm --global install yarn
  ```

  2. プロジェクトのトップで以下のコマンドを実行

  ```
  yarn install
  ```

#! /usr/bin/env bash
# exit on error
set -o errexit # エラー時にスクリプトを終了する

bundle install # gemのインストール
bundle exec rake assets:precompile # アセットのプリコンパイル
bundle exec rake assets:clean # 古いアセットの削除
bundle exec rake db:migrate # データベースのマイグレーション
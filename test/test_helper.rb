# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    # 指定のワーカー数でテストを並列実行する
    parallelize(workers: :number_of_processors)

    # test/fixtures/*.ymlにあるすべてのfixtureをセットアップする
    fixtures :all

    # （すべてのテストで使うその他のヘルパーメソッドは省略）

    # テストユーザーがログイン中の場合にtrueを返す
    def is_logged_in?
      !session[:user_id].nil?
    end

    # テストユーザーとしてログインする(チェックボックスのデフォルト値を'password'と1に設定)
    def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: { session: {
        email: user.email,
        password:,
        remember_me:
      } }
    end
  end
end

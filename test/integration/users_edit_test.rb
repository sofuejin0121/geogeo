# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    # 編集ページにアクセス
    get edit_user_path(@user)
    # editビューがレンダリングされるかどうかチェック
    assert_template 'users/edit'
    # patchメソッドを使って、無効な情報を送信する
    patch user_path(@user), params: { user: { name: '',
                                              email: 'foo@invalid',
                                              password: 'foo',
                                              password_confirmation: 'bar' } }

    # editビューが再描画されるかをどうかをチェックする
    assert_template 'users/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = 'Foo Bar'
    email = 'foo@bar.com'
    patch user_path(@user), params: { user: {
      name:,
      email:,
      # パスワードの変更が不要な場合はパスワードを入力しないでいいようにする
      password: '',
      password_confirmation: ''
    } }
    assert_not flash.empty?
    assert_redirected_to @user
    # 最新のユーザー情報をデータベースから再度読み込むことで、更新内容が正しいことを確認
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end

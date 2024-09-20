# frozen_string_literal: true

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  # 作成したマイクロポストが有効かどうかをチェック
  test 'should be valid' do
    assert @micropost.valid?
  end

  # user_idの存在性のバリデーションに対するテスト
  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test 'content should be present' do
    @micropost.content = '   '
    assert_not @micropost.valid?
  end

  test 'content should be at most 140 characters' do
    @micropost.content = 'a' * 141
    assert_not @micropost.valid?
  end

  test 'order should be m,ost recent first' do
    assert_equal microposts(:most_recent), Micropost.first
  end
end

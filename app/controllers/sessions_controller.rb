class SessionsController < ApplicationController
  def new; end

  def create
    # 送信されたメールアドレスを使って、データベースからユーザーを取り出している
    user = User.find_by(email: params[:session][:email].downcase)
    # ユーザーがデータベースにあり、かつ、認証に成功した場合にのみ
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        forwarding_url = session[:forwarding_url]
        # ユーザーログイン後にユーザー情報のページにリダイレクトする
        # 転送先URLをセッションから自動的に削除する
        reset_session # ログインの直前に必ずこれを書くこと
        # 論理値? ? 何かをする : 別のことをする
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # user.remember呼び出すまで遅延、そこで記憶トークンを生成してトークンのダイジェストをデータベースに保存
        log_in user
        redirect_to forwarding_url || user # redirect_to user == redirect_to user_url(user)
      else
        # エラーメッセージを作成する
        message = 'Account not activated.'
        message += 'Check your email for the activation link.'
        flash.now[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end

module SessionsHelper
    #渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
        #セッションリプレイ攻撃から保護する
        session[:session_token] = user.session_token
    end

    #永続的セッションのためにユーザーをデータベースに記憶する
    def remember(user)
        user.remember
        #permanent有効期限,encrypted暗号化
        cookies.permanent.encrypted[:user_id] = user.id 
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    #現在ログイン中のユーザーを返す（いる場合)
    #記憶トークンcookieに対応するユーザーを返す
    def current_user
        #ユーザーIDにユーザーIDのセッションを代入
        if (user_id = session[:user_id])
            user = User.find_by(id: user_id)
            @current_user ||= user if session[:session_token] == user.session_token
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    #渡されたユーザーがカレントユーザーであればtrueを返す
    def current_user?(user)
        user && user == current_user
    end

    #ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end


    #永続的セッションを破棄する
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    #現在のユーザーをログアウトする
    def log_out 
        forget(current_user)
        reset_session
        @current_user = nil #安全のため
    end

    # アクセスしようとしたURLを保存する
    #リクエストが送られたURLをsession変数の：forwarding_urlキーに保存している（getリクエストだけ)
    def store_location
        #request ユーザーが投げつけてきたデータの集合体
        session[:forwarding_url] = request.original_url if request.get?
    end
end

class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        
        if user && user.authenticate(params[:session][:password])
            # ユーザーをサインインし、ユーザーページ(show)にリダイレクト
            sign_in user
            redirect_back_or user
        else
            # エラーメッセージ表示、サインインフォームを再描画
            flash.now[:error] = 'invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        sign_out
        redirect_to root_url
    end
    
end
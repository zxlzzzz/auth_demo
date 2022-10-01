class LoginsController < ApplicationController




  def create
    username = params[:username]
    password = params[:password]

    if username.blank? or password.blank?
      return render json: { message: '信息不全' }
    end

    if User.not_exists?(username: params[:username])
      return render json: { message: '用户不存在' }
    end
    user = User.find_by_username username;
    if user.authenticate?("password", password)
      render json: {
        message: '登录成功!',
        token: user.generateJwt,
        code:200
      }
    else
      render json: { message: '密码错误!' }
    end

  end

  private

  def login_params
    params.permit(:username, :password)
  end
end

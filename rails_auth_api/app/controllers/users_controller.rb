class UsersController < ApplicationController


  def create
    if params[:username].blank? or params[:password].blank?
      return render json: { message: '信息不全' }
    end
    @user = User.new user_params
    if User.exists?(username: @user.username)
      return render json: { message: "用户已经存在" }
    end

    @user.password_method(params[:password])

    if @user.save
      return render json: { message: "创建成功",code:200 }
    else
      return render json: { message: "创建失败" }
    end

  end

  def destroy
    p user_params
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

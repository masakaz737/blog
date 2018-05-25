class UsersController < ApplicationController
  before_action :login_or_not, only: [:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorite_blogs
  end

  def update
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorite_blogs
    @user.password = current_user.password_digest
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "アイコンを追加しました！"
    else
      render 'show'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end

  def login_or_not
    if !current_user
      redirect_to new_session_path, notice:"ログインしてください"
    end
  end
end

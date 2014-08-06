class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    
    if User.find_by_name(params[:name]).present?
      redirect_to '/new_user', alert: "The username is taken"
    else
      @user = User.new
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confermation]
      if @user.save
        redirect_to "/users/#{ @user.id }"
        session["user_id"]=@user.id
      else
        render 'new', alert: "Something went wrong, please try again later." 
      end
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if session['user_id']!=@user.id
      redirect_to "/users"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confermation]

    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if session['user_id']!=@user.id
      redirect_to "/users"
    end
    @user.destroy


    redirect_to "/users"
  end
end

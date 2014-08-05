class SessionsController < ApplicationController
  def new
  end
  def create
    u = User.find_by(name: params["username"])
    if u && u.authenticate(params['password'])
      session["user_id"]=u.id
      redirect_to "/home"
    else
      redirect_to "/session/new"
    end
  end
    def destroy
      reset_session
      redirect_to "/home"
  end
end
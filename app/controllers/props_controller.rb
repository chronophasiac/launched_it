class PropsController < ApplicationController

  def new
    create
  end

  def create
    @app = App.find(params[:app_id])
    @prop = @app.props.new
    @prop.user = current_user
    if @prop.save
      redirect_to app_path(@app)
    else
      redirect_to app_path(@app), notice: "Your prop didn't save"
    end
  end

  def destroy
    @app = App.find(params[:app_id])
    @prop = @app.props.where(user_id: current_user.id).first
    @prop.destroy
    redirect_to app_path(@app)
  end

end

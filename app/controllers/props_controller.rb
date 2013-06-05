class PropsController < ApplicationController

  def new
    @app = App.find(params[:app_id])
    @prop = @app.props.new
    @prop.user = current_user
    create
  end

  def create
    if @prop.save
      redirect_to app_path(@app)
    else
      redirect_to app_path(@app), notice: "You've already given props."
    end
  end

end

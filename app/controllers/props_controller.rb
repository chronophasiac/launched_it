class PropsController < ApplicationController

  def new
    @app = App.find(params[:app_id])
    @prop = @app.props.new
    @prop.user = current_user
    @prop.save
    redirect_to app_path(@app)
  end

end

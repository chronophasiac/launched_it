module CommentsHelper
  def get_app
    @app = App.find(params[:id])
  end
end

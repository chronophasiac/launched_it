class CommentsController < ApplicationController
  before_filter :authenticate_user!
  around_filter :catch_not_found

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = current_user.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to apps_path, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end

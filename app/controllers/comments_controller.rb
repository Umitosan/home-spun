class CommentsController < ApplicationController
  # before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @comment.save
    flash[:notice] = "Comment successfully added!"
      @comment = Comment.new
      respond_to do |format|
        format.html { redirect_to products_url }
        format.js
      end
    else
      render :new
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end
  #
  # def update
  #   @comment= Comment.find(params[:id])
  #   if @comment.update(comment_params)
  #     flash[:notice] = "Comment successfully updated!"
  #     redirect_to products_path
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @comment = Comment.find(params[:id])
  #   if @comment.destroy
  #     flash[:notice] = "Comment successfully removed!"
  #     redirect_to products_path
  #   end
  # end

private
  def comment_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:comment).permit(:description)
  end
end

class CommentsController < ApplicationController
 
  def create
    @comment = Comment.create(comment_params)
       redirect_to "/recipes/#{@comment.recipe_id}"
    if @comment.save
      #ActionCable.server.broadcast 'comment_channel', content: @comment
      comment_html = render_to_string partial: 'comment', locals: {comment: @comment}
      ActionCable.server.broadcast 'comment_channel', content: comment_html
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end

class PostCommentsController < ApplicationController
    def create
        @proverb = Proverb.find(params[:proverb_id])
        comment = current_user.post_comments.new(comment_params)
        comment.proverb_id = @proverb.id
        comment.save
        redirect_to proverb_path(@proverb)
    end

    def destroy
        comment = PostComment.find(params[:id])
        binding.pry
        comment.destroy
        redirect_to proverb_path(params[:proverb_id])
    end

    private
    def comment_params
        params.require(:post_comment).permit(:comment)
    end
end

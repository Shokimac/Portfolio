class PostCommentsController < ApplicationController
    def create
        @proverb = Proverb.find(params[:proverb_id])
        comment = current_user.post_comments.new(comment_params)
        comment.proverb_id = @proverb.id
        binding.pry
        comment.save
        redirect_to proverb_path(@proverb)
    end

    def destroy
        
    end

    private
    def comment_params
        params.require(:post_comment).permit(:comment)
    end
end

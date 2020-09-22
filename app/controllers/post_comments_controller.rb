class PostCommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @proverb = Proverb.find(params[:proverb_id])
        @comment = current_user.post_comments.new(comment_params)
        @comment.proverb_id = @proverb.id
        if @comment.save
        redirect_to proverb_path(@proverb)
        else
        @comment.errors.full_messages
        @comments = PostComment.where(proverb_id: @proverb.id).includes(:user, :proverb).page(params[:page]).reverse_order
        render 'proverbs/show'
        end
    end

    def destroy
        comment = PostComment.find(params[:id])
        if comment.destroy
        redirect_to proverb_path(params[:proverb_id])
        else
            render 'proverbs/show', notice: 'コメントの削除に失敗しました。'
        end
    end

    private
    def comment_params
        params.require(:post_comment).permit(:comment)
    end
end

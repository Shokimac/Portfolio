class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
    InquiryMailer.send_mail(@inquiry).deliver_now
    redirect_to root_path, notice: 'メールが送信されました。'
    else
      @inquiry.errors.full_messages
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :message)
  end

end

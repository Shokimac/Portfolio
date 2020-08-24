class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
    binding.pry
    InquiryMailer.send_mail(@inquiry).deliver_now
    redirect_to episodes_path
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :message)
  end

end

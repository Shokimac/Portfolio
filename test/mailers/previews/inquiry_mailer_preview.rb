# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
    def inquiry
        inquiry = Inquiry.new(name: "テスト　太郎", message: "お問い合わせのテストです")
        InquiryMailer.send_mail(inquiry)
    end
end

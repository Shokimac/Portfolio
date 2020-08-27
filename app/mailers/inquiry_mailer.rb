class InquiryMailer < ApplicationMailer
    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
            to:   ENV['MAIL_TO'],
            subject: 'お問い合わせがありました'
        )
    end
end

class InquiryMailer < ApplicationMailer
    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
            from:   'curin020304@gmail.com',
            to:     'curin030204@yahoo.co.jp',
            subject: 'お問い合わせ'
        )
    end
end

class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_p3(p3)
    # sendmail_blog(p3)にしてた
    @p3 = p3

    mail to: "yuri715lily_momo@yahoo.co.jp"
    subject:'post is done'
  end
end

class ContactMailer < ApplicationMailer

  def send_mail(mail_title, mail_content, group_users)
    @mail_title = mail_title
    @mail_content = mail_content
    mail bcc: group_users.pluck(:email), subject: mail_title
  end
end
# groupsコントローラから呼び出され値を受け取る
# mailer個別の設定
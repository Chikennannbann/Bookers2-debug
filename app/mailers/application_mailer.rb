class ApplicationMailer < ActionMailer::Base
  default from: '管理人<from@example.com>'
  layout 'mailer'
end

# 全mailer共通の設定
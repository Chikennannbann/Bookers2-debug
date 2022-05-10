class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

# 全mailer共通の設定
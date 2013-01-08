class MailInterceptor
  def self.delivering_email(message)
    message.subject = "DIES-IST-EIN-TEST: #{message.to} #{message.subject}"
    message.to = "support@screenconcept.ch"
  end
end


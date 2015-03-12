class UserMailer < ActionMailer::Base

	def receive(message)
    # puts message.inspect
  	Comment.create!(from: message.from, subject: message.subject, body: message.body)
	end
end
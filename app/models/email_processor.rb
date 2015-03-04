class EmailProcessor
  def self.process(email)
  	user = User.find_by(email: email)
  	user.comments.create!(from: email.from, subject: email.subject, body: email.body)
  end
end
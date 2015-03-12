require 'mailman'

Mailman.config.maildir = '~/Maildir'

Mailman.config.pop3 = {
  :username => 'dilpreettest@gmail.com',
  :password => 'vinsol123#',
  :server   => 'pop.gmail.com',
  :port     => 995, # you can usually omit this, but it's there
  :ssl      => true # defaults to false
}

Mailman::Application.run do
  default do
    puts "Received mail from #{ message.from }"
    # user = User.find_by(email: message.from.first)
    # user.comments.create!(from: message.from.first, to: message.to.first, body: message.body.decoded, subject: message.subject)
  end
  to('abc@vinsol.com') do
    puts "Received mail to"
  end
  from('abc@vinsol.com') do
    puts "Received mail"
  end
  
  # to('abc@vinsol').from('') do
  # end
end
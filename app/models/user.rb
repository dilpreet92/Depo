class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 

  has_many :comments

  def admin?
  	email == 'dilpreet.makkar92@gmail.com'
  end

end

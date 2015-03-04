class Book < ActiveRecord::Base
	belongs_to :article
end
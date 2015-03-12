class EmailsController < ApplicationController

	def create
		UserMailer.receive(request.request_parameters)
	end
end
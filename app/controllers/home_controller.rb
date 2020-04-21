class HomeController < ApplicationController
	def index
		@data = Datum.all.to_json

		render 'index'
	end
end



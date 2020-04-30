class HomeController < ApplicationController
	def index
		@dataToUse = Datum.all.to_json

		render 'index'
	end
end


#<Datum id: 99, Date: "2020-05-09 00:00:00", Cases: nil, Gompertz: 1159098.268, New_Cases: nil, Italy_Trajectory: 1052561.9, Germany_Trajectory: 649153.2646, Spain_Trajectory: 1583893.067, created_at: "2020-04-29 16:00:14", updated_at: "2020-04-29 16:00:14">



class HomesController < ApplicationController

	def top
		flash[:notice] = "Signed up successfully."
		flash[:logout] = "Signed out successfully."
		flash[:in] = "Signed in successfully."


	end

	def about
	end

end

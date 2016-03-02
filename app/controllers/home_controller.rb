class HomeController < ApplicationController
	def index
	end

	def search
	end

	def new_search
		# @users = User.where(email: params[:query])
		@users = User.where(fname: params[:query])
		# redirect_to :search
	end
end

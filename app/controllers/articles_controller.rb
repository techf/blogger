class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	
	def show
	#	render json: params	
		@article = Article.find(params[:id])	
	end
end

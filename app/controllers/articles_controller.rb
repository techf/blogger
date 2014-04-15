class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end
	
	def show
	#	render json: params	
		@article = Article.find(params[:id])	
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save
		flash[:success] = "successfully created article '#{@article.title}'"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.delete
		flash[:info] = "the article '#{@article.title}' successfully deleted."

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash[:success] = "Article '#{@article.title}' is successfully updated"

		redirect_to article_path(@article)
	end
end

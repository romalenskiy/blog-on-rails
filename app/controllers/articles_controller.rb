class ArticlesController < ApplicationController
include ArticlesHelper

	before_action :require_login, except: [:show, :index]
	
	def index
		@articles = Article.all
	end
	
	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to article_path(@article)
		
		flash.notice = "Article successfully created!"
	end
	
	def destroy
		@article = Article.find(params[:id]).destroy
		redirect_to articles_path
		
		flash.notice = "Article successfully deleted!"
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		
		flash.notice = "Article '#{@article.title}' successfully updated!"
		
		redirect_to article_path(@article)
	end
	
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
end

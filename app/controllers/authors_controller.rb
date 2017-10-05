class AuthorsController < ApplicationController		
	def index
	authors = Author.order('created_at DESC');
	render json: {status: 'SUCCESS', message: 'loaded authors', data: authors}, status: :ok
	end
	
	def show
    	@author = Author.find(params[:id])
    	@articles = @author.articles
		render json: @articles, status: 200
  			
	end
end

module Api	
	class ArticlesController < ApplicationController
		def index
			articles = Article.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'loaded articles', data: articles}, status: :ok
		end
		
	
		def create
			article = Article.new(article_params)
			if article.save
				render json: {status: 'SUCCESS', message: 'saved article', data: article}, status: :ok
			else
				
				render json: {status: 'ERROR', message: 'failed loading articles', data: article.errors}, status: :unprocessable_entry
			end
		end

		def destroy
			article = Article.find(params[:id])
			article.destroy
			render json: {status: 'SUCCESS', message: 'deleted article successfully', data: article}, status: :ok
		end

		def update
			article = Article.new(article_params)
			if article.update_attributes(article_params)
				render json: {status: 'SUCCESS', message: 'article updated', data: article}, status: :ok
			else
				render json: {status: 'ERROR', message: 'failed updating articles', data: article.errors}, status: :unprocessable_entry
			end
		end

		private
		def article_params
			params.permit(:title, :body)
		end
	end
end
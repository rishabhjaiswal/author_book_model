module Api	
	class AuthorsController < ApplicationController
		def index
			
			authors = Author.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'loaded authors', data: authors}, status: :ok
		end
		

		
		def create
			author = Author.new(author_params)
			if author.save
				render json: {status: 'SUCCESS', message: 'saved author', data: author}, status: :ok
			else
				render json: {status: 'ERROR', message: 'failed loading authors', data: author.errors}, status: :unprocessable_entry
			end
		end

		def destroy
			author = Author.find(params[:id])
			author.destroy
			render json: {status: 'SUCCESS', message: 'deleted author successfully', data: author}, status: :ok
		end

		def update
			author = Author.new(author_params)
			if author.update_attributes(author_params)
				render json: {status: 'SUCCESS', message: 'author updated', data: author}, status: :ok
			else
				render json: {status: 'ERROR', message: 'failed updating authors', data: author.errors}, status: :unprocessable_entry
			end
		end

		private
		def author_params
			params.permit(:name, :age)
		end
	end
end
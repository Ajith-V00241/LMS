class BooksController < ApplicationController
	def index
		@books = Book.all
	end
	
	def searchedIndex
		@book = Book.search(params[:search])
	end

	def show
		@book = Book.find(params[:id])
	end

	def thank
		
	end

	def lend
		#puts "----------DATE TODAY: "+Date.today.to_s
		@book = Book.find_by(id: params[:id])
		@lendedBook = LendedBook.create(name: @book.title, username: current_user.username, date_of_lend: Date.today.to_s, user_id: current_user.id)
		redirect_to '/books/thank'
	end

	def returnBook
		LendedBook.find(params[:id]).destroy
		redirect_to '/users/lendedBooks'
	end


	private
	def book_params 
		params.require(:book).permit(:title, :author, :publisher, :language, :description, :search)
	end
end

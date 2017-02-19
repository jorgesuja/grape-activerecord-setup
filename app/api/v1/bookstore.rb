module API
  module V1
    class Bookstore < Grape::API

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ message: e.message, status: 404 }, 404)
      end

      resource :books do

        get '/' do
          Book.all
        end

        route_param 'book_id' do

          get '/' do
            Book.find params[:book_id]
          end
        end
      end

      resource :authors do

        get '/' do
          Author.all
        end

        route_param 'author_id' do

          get '/' do
            Author.find params[:author_id]
          end

          get '/books' do
            Book.where(author_id: params[:author_id])
          end
        end
      end
    end
  end
end

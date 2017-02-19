module API
  class Root < Grape::API

    format :json

    mount API::V1::Status
    mount API::V1::Bookstore

    route :any, '*path' do
      error!({ message: 'Not found', status: 404 }, 404)
    end
  end
end

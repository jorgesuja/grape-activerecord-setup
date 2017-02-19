module API
  module V1
    class Status < Grape::API
      get '/status' do
        { status: 'ok' }
      end
    end
  end
end

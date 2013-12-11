require 'bundler'
Bundler.require

module Churchill_Generator
  class Churchill < Sinatra::Application
    get '/home' do
      "here are some quotes"
    end

  end

end
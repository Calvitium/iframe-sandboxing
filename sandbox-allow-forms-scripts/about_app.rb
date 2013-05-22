require 'rack'
require 'sinatra/base'

class AboutApp < Sinatra::Base
  def initialize(app, opts)
    @name = opts.delete(:name)
  end

  get '/about' do
    "Hello, my name is #{@str} !"
  end
end
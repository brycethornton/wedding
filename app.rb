# myapp.rb
require 'rubygems'
require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  now     = Date.today()
  wedding = Date.civil(2009, 6, 6)
  days_left = wedding-now
  
  if (days_left == 0)
    @days_left = "Today's The Day!"
  elsif (days_left < 0)
    @days_left = "We're Married!!"
  else
    @days_left = "only #{days_left} days left"
  end

  haml :index
end

get '/directions' do
  haml :directions
end

get '/hotel' do
  haml :hotel
end

get '/attendants' do
  haml :attendants
end

get '/activities' do
  haml :activities
end

get '/photos' do
  haml :photos
end

get '/registry' do
  haml :registry
end

get '/contact' do
  haml :contact
end


require 'toto'

use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

toto = Toto::Server.new do
  set :title, 'Erlang Quick Tips'
  set :author, 'Nick Gerakines'
  set :disqus, 'erlangquicktips'
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto



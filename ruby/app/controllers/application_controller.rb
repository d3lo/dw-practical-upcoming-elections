# coding: utf-8
require 'sinatra'
require 'rack'
require 'rack/csrf'
require 'net/http'

require_relative '../../lib/upcoming_elections/us_states'
include UsStates

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    use Rack::Session::Cookie, :secret => "some unique secret string here"
    use Rack::Csrf, :raise => true
  end

  get '/' do
    erb :address_form, { :locals => {:us_states => UsStates::POSTAL_ABBREVIATIONS},
                         :layout => true }
  end

  post "/search" do
    # params: {
    #  "street"=>"123 street",
    #  "street_2"=>"a28",
    #  "city"=>"atlanta",
    #  "state"=>"GA",
    #  "zip"=>"30339"}

    state = params[:state].downcase
    city = params[:city].downcase
      .gsub(/[^a-z ]/i, '') # strip non-alpha
      .gsub(/\s/, '_') # replace spaces with underscores
    ocd_id = "ocd-division/country:us/state:#{state}/place:#{city}"

    url = URI.parse('https://api.turbovote.org/elections/upcoming?district-divisions=' + ocd_id)
    req = Net::HTTP::Post.new(url.to_s, 'Content-Type' => 'application/json')
    res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http|
      http.request(req)
    }

    erb :search_results, { :locals => {
                              :ocd_id => ocd_id,
                              :results => res.body },
                           :layout => true }
  end
end

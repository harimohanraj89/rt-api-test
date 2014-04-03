require 'open-uri'

class RtApiController < ApplicationController

	def index
	end

	def search
		@query = params[:q].downcase.split.join('+')
		@raw_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=#{URI.escape(query)}&page_limit=10&apikey=#{ENV["ROTTEN_TOMATOES_API_KEY"]}")
    response = JSON.parse(raw_response)
    @results = response['movies']
	end

  def movies
    @movie_id = params[:id]
    @raw_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{movie_id}.json?apikey=#{ENV["ROTTEN_TOMATOES_API_KEY"]}")
    @movie = JSON.parse(raw_response)
  end

end

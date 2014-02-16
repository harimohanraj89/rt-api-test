require 'open-uri'

class RtApiController < ApplicationController

	def index
	end

	def search
		query = params[:q]
		file = open("http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=#{URI.escape(query)}&page_limit=1&page=1&apikey=#{ENV["ROTTEN_TOMATOES_API_KEY"]}")
		@output = JSON.load(file.read)["movies"].first
	end

end

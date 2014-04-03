class RtApiController < ApplicationController

  @@num_results = 10

	def index
	end

	def search
    @results = RottenTomatoes.search(params[:q], @@num_results)
	end

  def movies
    @movie = RottenTomatoes.movie(params[:id])
  end

end

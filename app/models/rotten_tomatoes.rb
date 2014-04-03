class RottenTomatoes
  def self.search(query, num_results)
    escaped_query = query.downcase.split.join('+')
    raw_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=#{escaped_query}&page_limit=#{num_results}&apikey=#{ENV["ROTTEN_TOMATOES_API_KEY"]}")
    response = JSON.parse(raw_response)
    return response['movies'] || []
  end

  def self.movie(rt_id)
    raw_response = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{rt_id}.json?apikey=#{ENV["ROTTEN_TOMATOES_API_KEY"]}")
    return JSON.parse(raw_response)
  end
end

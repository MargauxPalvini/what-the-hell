require "open-uri"

class MovieRecommendation

  def self.get_recommendations(movie_title)
    movie_url = "https://actorrecognition-tdevy3cs7a-ew.a.run.app/movie_recommender?movie=#{URI.encode(movie_title)}"

    begin  
      movie_response = URI.parse(movie_url).read(read_timeout: 3)
      JSON.parse(movie_response)
    rescue Net::ReadTimeout
      {"ERROR": "Time out"}
    end
  end


  # old
  def self.get_movie_names(movie)
    movie_url = "https://actorrecognition-tdevy3cs7a-ew.a.run.app/movie_recommender?movie=#{movie[:title]}"

    movie_response = URI.parse(movie_url).read
    JSON.parse(movie_response)
  end
end

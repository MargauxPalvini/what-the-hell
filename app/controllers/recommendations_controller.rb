#require_relative "../services/movie_recommendation.rb"
#require_relative "../services/tmdb.rb"

class RecommendationsController < ApplicationController

  def recommendations
    recommendations = MovieRecommendation.get_recommendations params[:movie_title]

    @movie_title = params[:movie_title]

    if !recommendations["ERROR"] || recommendations["ERROR"].empty?
      first_three_recommendations = recommendations.first(3)
      @complete_recommendations = first_three_recommendations.map do |reco|
        Tmdb.movie_from_title(reco[1])
      end
      render json: { html: render_to_string(partial: 'shared/movie_recommendations')}
    else
      render json: recommendations
    end
    
  end

end

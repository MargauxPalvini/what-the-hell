#require_relative "../services/tmdb.rb"

class SearchActorController < ApplicationController


  def step1
    "hi"
  end

  def step2
    # make the first movie id available
    @first_id = params[:id1]

    # look for the first movie actors
    @movie = Tmdb.get_movie(@first_id)
    @actors = Tmdb.search_cast(@first_id)
    @display_actors = @actors.sort{|b, a| a["popularity"] - b["popularity"]}.first(4)
  end

  def step3
    "step3"
  end


  def dispatch_post
    if (dispatch_params['movie-id'] && dispatch_params['first-movie-id'])
      redirect_to step3_path(id1: dispatch_params['first-movie-id'], id2: dispatch_params['movie-id']) 
    elsif(dispatch_params['movie-id'])
      redirect_to step2_path(id1: dispatch_params['movie-id']) 
    else 
      redirect_to step1_path 
    end
  end

  private

  def dispatch_params
    params.permit('first-movie-id', 'movie-id')
  end

end

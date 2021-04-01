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
    @actors1 = Tmdb.search_cast(params[:id1])
    @actors2 = Tmdb.search_cast(params[:id2])
    @common_actors_id = find_common_actors_id(@actors1, @actors2)
    
    # only needed if there is no direct match
    if(@common_actors_id.count != 1)
      @movie1 = Tmdb.get_movie(params[:id1])
      @movie2 = Tmdb.get_movie(params[:id2])
    end

    if @common_actors_id.count > 0
      @common_actors = @common_actors_id.map{|id| @actors1.find{|actor|actor['id'] == id}}
    end

    if @common_actors_id.count == 0 
      @display_actors = @actors2.sort{|b, a| a["popularity"] - b["popularity"]}.first(4)
    end

    if @common_actors_id.count == 1
      @unique_actor = Tmdb.get_actor(@common_actors[0]['id'])
    end 

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

  def find_common_actors_id(actors1, actors2)
    actors1.map{|actor|actor['id']} & actors2.map{|actor|actor['id']}
  end

  def dispatch_params
    params.permit('first-movie-id', 'movie-id')
  end

end

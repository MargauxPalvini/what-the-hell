class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    set_instance_vars
  end

  def create
    query = params[:queries] ? "#{params[:queries]} #{params[:search][:query]}" : params[:search][:query]
    @search = Search.new(query: query)
    @search.user = current_user if user_signed_in?
    if @search.save
      redirect_to root_path(construct_query)
    else
      render :new
    end
  end

  private

  def construct_query
    if params[:search][:photo]
      search_params
    else
      { search: { queries: params[:search][:query] + (params[:queries] || "") } }
    end
  end

  def user_params
    params.except(:controller, :action)
  end

  def set_instance_vars
    user_params.empty? || user_params[:photo] ? no_params : set_vars_from_params
    @search = Search.new
  end

  def no_params
    @query = []
    @results = []
  end

  def set_vars_from_params
    @query = "&" + user_params[:search][:queries].strip
    @results = search_results(full_query)
  end

  def full_query
    user_params
      .as_json
      .map { |key, _value| params[key] }
      .join('&')
  end

  def search_results(query)
    search = Search.find_by(query: query) || Search.create(query: query)
    JSON.parse(search.result.json)
  end

  def search_params
    params.require(:search).permit(:query, :photo)
  end
end

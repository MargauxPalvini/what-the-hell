class CastMatcherJob < ApplicationJob
  queue_as :default

  def perform(query)
    @query = query
    if query.count > 1 && (actor_ids = Tmdb.matching_cast(query)) && actor_ids.count > 1
      # if we have 2 movie inputs and several matching actors
      actor_ids.map { |actor_id| Result.create(json: Tmdb.get_actor_details(actor_id)) }
      actor_ids.each { |actor| broadcast_actor(actor) }
    else
      # if there is only 1 movie input or no matching actors display preresults page
      Tmdb.get_actors(query.last.to_i).each { |actor| broadcast_actor(actor) }
    end
  end

  private

  def broadcast_actor(actor)
    BroadcastJob.perform_now(
      { channel: "CastMatcher",
        query: @query,
        partial: "shared/cards/actor_card",
        locals: { actor: actor } }
    )
  end
end

# This is just for fun so far
class MyWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }
  sidekiq_options queue: :schedueled

  def perform

  end
end

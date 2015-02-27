# This is just for fun so far
class MyWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }
  sidekiq_options queue: :schedueled

  def perform
    stat = DiagnosticStatistic.new rpm: 1235,
                                   speed: 123.0,
                                   consumption: 5.5,
                                   car_id: 1
    stat.save!
  end
end

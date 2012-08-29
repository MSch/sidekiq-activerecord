class LongRunningWorker
  include Sidekiq::Worker

  def perform(entry_id)
    ActiveRecord::Base.transaction requires_new: true do
      e = Entry.find(entry_id)
      e.bar = 'bar'
      e.save!
      sleep 60
    end
  end
end

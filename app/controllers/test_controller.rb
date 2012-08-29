class TestController < ApplicationController
  def entry
    ActiveRecord::Base.transaction requires_new: true do
      e = Entry.create!
      e.bar = 'bar'
      e.save!
      sleep 60
    end
  end

  def kill
    Kernel.exit
  end
end

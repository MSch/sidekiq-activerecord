Sidekiq / ActiveRecord transaction bug
======================================

How to reproduce:

    bundle install
    rake db:migrate

Run this in `rails console`

    e = Entry.create!
    LongRunningWorker.perform_async(e.id)

Start sidekiq and wait for it to perform the job (UPDATE entries ...)
then the long running worker does a `sleep 60`. Press Ctrl-C and watch
how ActiveRecord COMMITs instead of performing a ROLLBACK.

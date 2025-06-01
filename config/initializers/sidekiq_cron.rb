require 'sidekiq/cron/job'
  
if Sidekiq.server?
  require 'sidekiq/cron/job'
  
  Sidekiq::Cron::Job.create(
    name: 'Send weekly summary email',
    cron: '0 9 * * 0',
    class: 'WeeklySummaryJob'
  )
end

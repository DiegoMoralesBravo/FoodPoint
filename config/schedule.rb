env :PATH, ENV['PATH']
set :output, 'log/cron.log'

every 1.days, at: "11:59 pm" do
    rake "status:update"
end

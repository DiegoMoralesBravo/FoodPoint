namespace :status do
  desc "TODO"
  task update: :environment do
    Order.where(status: 'wait').update_all(status: 'paid')
    Order.where(status: 'progress').update_all(status: 'paid')
    Order.where(status: 'done').update_all(status: 'paid')
  end
end

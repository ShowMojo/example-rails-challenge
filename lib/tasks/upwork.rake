namespace :seeder do
  task run: :environment do
    require 'seeder/seeder'

    seeder = Seeder.new
    seeder.run
  end
end
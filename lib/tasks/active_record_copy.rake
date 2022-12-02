require "csv"
namespace :copy do
  desc "imports data from csv to postgresql database"
  task :data => :environment do
    csv_text = File.read("#{Rails.root}/lib/tasks/remote-companies.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Company.create!(row.to_hash)
    end
  end
end

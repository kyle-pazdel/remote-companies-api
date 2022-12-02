require "csv"
namespace :copy do
  desc "imports data from csv to postgresql database"
  task data: :environment do
    def insert_company
      companies = []
      CSV.foreach("/Users/KylePazdel/Desktop/remote-companies.csv", headers: true) do |row|
        companies << row
      end
      time = Time.now.getutc

      Company.copy_from_client [:name, :url, :region, :created_at, :updated_at] do
        companies.each do |d|
          copy << [d[:name], d[:last_name], d[:email], time, time]
        end
      end
    end
  end
end

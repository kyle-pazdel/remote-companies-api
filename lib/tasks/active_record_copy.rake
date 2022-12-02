# require 'csv'
# namespace :copy do
#   desc "imports data from csv to postgresql database"
#   task data: :environment do
#     def insert_company
#       companies = []
#       CSV.foreach(filename, headers: true) do |row|
#         companies << row
#       end
#       time = Time.now.getutc

#       Company.copy_from_client [:]
#     end
#   end
# end

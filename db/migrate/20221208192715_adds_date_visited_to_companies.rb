class AddsDateVisitedToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :date_visited, :datetime
  end
end

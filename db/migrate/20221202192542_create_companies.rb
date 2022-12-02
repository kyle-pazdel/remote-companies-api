class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :region
      t.boolean :favorite
      t.text :notes

      t.timestamps
    end
  end
end

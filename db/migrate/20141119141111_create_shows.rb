class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :city
      t.date :show_date
      t.string :venue
      t.string :info_url
      t.string :quick_info
      t.boolean :sold_out
      t.text :description

      t.timestamps
    end
  end
end

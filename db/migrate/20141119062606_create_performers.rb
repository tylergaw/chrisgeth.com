class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :name

      t.timestamps
    end
  end
end

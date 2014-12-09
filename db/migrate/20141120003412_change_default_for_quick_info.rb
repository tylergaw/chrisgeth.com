class ChangeDefaultForQuickInfo < ActiveRecord::Migration
  def change
    change_column :shows, :sold_out, :boolean, default: false
  end
end

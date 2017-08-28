class ChangeColumnsInUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :income, :rent
      t.column :income, :decimal, :precision => 10, :scale => 2
      t.column :rent, :decimal, :precision => 10, :scale => 2
    end
  end
end

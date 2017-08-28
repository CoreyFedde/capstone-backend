class ChangeColumnsInLoans < ActiveRecord::Migration[5.0]
  def change
    change_table :loans do |t|
      t.remove :minimum_monthly_payment, :principal, :interest_rate, :current_monthly_payment
      t.column :principal, :decimal, :precision => 10, :scale => 2
      t.column :current_monthly_payment, :decimal, :precision => 10, :scale => 2
      t.column :interest_rate, :decimal, :precision => 4, :scale => 2
    end
  end
end

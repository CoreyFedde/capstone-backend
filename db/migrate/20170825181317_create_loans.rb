class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :name
      t.string :lender
      t.integer :principal
      t.integer :interest_rate
      t.integer :loan_length
      t.date :start_date
      t.integer :minimum_monthly_payment
      t.integer :current_monthly_payment
      t.timestamps
    end
  end
end

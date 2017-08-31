class ChangeInterestRateNullFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_null :loans, :interest_rate, false
  end
end

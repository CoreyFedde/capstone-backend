class ChangeLoanLengthNullFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_null :loans, :loan_length, false
  end
end

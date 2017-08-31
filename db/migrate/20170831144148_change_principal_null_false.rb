class ChangePrincipalNullFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_null :loans, :principal, false
  end
end

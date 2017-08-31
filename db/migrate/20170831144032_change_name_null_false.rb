class ChangeNameNullFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_null :loans, :name, false
  end
end

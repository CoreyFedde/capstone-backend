class AddUserToLoans < ActiveRecord::Migration[5.0]
  def change
    add_reference :loans, :user, foreign_key: true
  end
end

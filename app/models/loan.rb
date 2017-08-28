class Loan < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

#reader_attr
  def monthly_payment
    self[:monthly_payment]
  end
# virtual attribute
  def monthly_payment
    [loan_length]
  end
end


class Loan < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  validates :name, :loan_length, :principal, :interest_rate, presence: true

#reader_attr
  def principal
    self[:principal].to_f
  end
  def interest_rate
    self[:interest_rate].to_f
  end
  def interest_rate_monthly
    (interest_rate / 100) / 12
  end
  def loan_length
    self[:loan_length].to_f
  end
  def loan_length_periods
    loan_length / 12
  end
  def period
    1
  end

# virtual attribute
  def monthly_payment
    if principal.zero? || interest_rate.zero?
      0
    else
    # interest_rate
    # (1 - (1 + interest_rate)**(-1))
    # (principal * interest_rate) / (0)
    ((principal * interest_rate_monthly) / (1 - (1 + interest_rate_monthly)**(-loan_length))).round(2)
      # (principal * ((interest_rate / 100) / 12)) / (1 - (1 + ((interest_rate / 100) / 12))**(-1))
    end
  end
  def monthly_interest
    monthly_payment + (1 + interest_rate_monthly)**(period - 1) * (principal * interest_rate_monthly - monthly_payment)
  end
  def monthly_principal
    monthly_payment - monthly_interest
  end
  def total_amount
    (monthly_payment * loan_length).round(2)
  end
  def total_interest
    ((monthly_payment * loan_length) - principal).round(2)
  end
end


class Loan < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  validates :name, :loan_length, :principal, :interest_rate, presence: true

# These are all the implicit attributes defined by user
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

# virtual attributes
# These are the implicit attributes taken from inputted data
  def loan_length_periods
    loan_length * 12
  end

  def period
    1
  end

  def total_amount
    (monthly_payment * loan_length_periods).round(2)
  end

  def total_interest
    ((monthly_payment * loan_length_periods) - principal).round(2)
  end

  # Null is not a number, so it detects if any of the variables are zero.
  def monthly_payment
    if principal.zero? || interest_rate.zero?
      0
    else
    # P PMT equation to find monthly payment
    ((principal * interest_rate_monthly) / (1 - (1 + interest_rate_monthly)**(-loan_length_periods))).round(2)
    end
  end

  # Iterates through the IPMT equation and puts the cumulative interest into a new
  # array
  def monthly_interest
    interest_array = []
    y = 0
    cumulative_interest = 0
    currentValue = principal
    while y < loan_length_periods do
      interest_holder = currentValue * interest_rate_monthly
      cumulative_interest += interest_holder
      principal_holder = monthly_payment - interest_holder
      balance_holder = currentValue - principal_holder
      currentValue = balance_holder
      interest_array.push(cumulative_interest.round(2))
       y += 1
    end
    interest_array
  end

  # Iterates through the IPMT equation and puts the cumulative principal into a
  # new array
  def monthly_principal
    principal_array = []
    y = 0
    cumulative_principal = 0
    currentValue = principal
    while y < loan_length_periods do
      interest_holder = currentValue * interest_rate_monthly
      principal_holder = monthly_payment - interest_holder
      cumulative_principal = cumulative_principal + principal_holder
      balance_holder = currentValue - principal_holder
      currentValue = balance_holder
      principal_array.push(cumulative_principal.round(2))
      y += 1
    end
    principal_array
  end

  # Iterates through the IPMT equation and puts the current balance into a
  # new array
  def monthly_balance
    balance_array = []
    y = 0
    currentValue = principal
    while y < loan_length_periods do
      interest_holder = currentValue * interest_rate_monthly
      principal_holder = monthly_payment - interest_holder
      balance_holder = currentValue - principal_holder
      currentValue = balance_holder
      balance_array.push(balance_holder.round(2))
      y += 1
    end
    balance_array
  end
end

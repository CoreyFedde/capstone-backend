
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
    loan_length * 12
  end
  def period
    1
  end

# virtual attributes
def total_amount
  (monthly_payment * loan_length_periods).round(2)
end
def total_interest
  ((monthly_payment * loan_length_periods) - principal).round(2)
end
def monthly_payment
  if principal.zero? || interest_rate.zero?
    0
  else
  ((principal * interest_rate_monthly) / (1 - (1 + interest_rate_monthly)**(-loan_length_periods))).round(2)
  end
end

# principal = 100000
# loan_length_periods = 36
# interest_rate_monthly = 0.00375
# monthly_payment = 2974.69


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
    # @principal_array.push(monthly_principal.round(2))
    # @balance_array.push(currentValue.round(2))
     y +=1
  end
  interest_array
end

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
    # interest_array.push(interest_holder.round(2))
    principal_array.push(cumulative_principal.round(2))
    # @balance_array.push(currentValue.round(2))
     y +=1
  end
  principal_array
end

def monthly_balance
  balance_array = []
  y = 0
  currentValue = principal
  while y < loan_length_periods do
    interest_holder = currentValue * interest_rate_monthly
    principal_holder = monthly_payment - interest_holder
    balance_holder = currentValue - principal_holder
    currentValue = balance_holder
    # interest_array.push(interest_holder.round(2))
    # @principal_array.push(monthly_principal.round(2))
    balance_array.push(balance_holder.round(2))
     y +=1
  end
  balance_array
end
# interest_array = []
# principal_array = []
# balance_array = []
# currentValue = principal

# y = 0

# while y < loan_length_periods  do
#   monthly_interest = currentValue * interest_rate_monthly
#   monthly_principal = monthly_payment - monthly_interest
#   balance = currentValue - monthly_principal
#   currentValue = balance
#   @interest_array.push(monthly_interest.round(2))
#   # @principal_array.push(monthly_principal.round(2))
#   # @balance_array.push(currentValue.round(2))
#    y +=1
# end

# puts(interest_array)
# puts(principal_array)
# puts(balance_array)

  # def monthly_interest
  #   currentValue = principal
  #   for (i=0, i < loan-length-period, i++) {
  #   monthly_interest = currentValue * interest_rate_monthly.round(2)
  #   monthly_principal = monthly_payment - monthly_interest.round(2)
  #   balance = currentValue - monthly_principal.round(2)
  #   currentValue = balance
  #   interest_array.push(monthly_interest)
  #   principal_array.push(monthly_principal)
  #   balance_array.push(currentValue)
  #   }
  #   principal
  #   interest_rate_monthly
  #   loan_length_periods
  #   monthly_payment
  #
  #   monthly_payment + (1 + interest_rate_monthly)**(period - 1) * (principal * interest_rate_monthly - monthly_payment)
  # end
  # def monthly_principal
  #   monthly_payment - monthly_interest
  # end

end

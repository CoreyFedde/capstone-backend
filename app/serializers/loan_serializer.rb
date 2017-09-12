class LoanSerializer < ActiveModel::Serializer
  attributes :id, :name, :lender, :principal, :interest_rate, :loan_length,
              :start_date, :current_monthly_payment, :monthly_payment, :monthly_interest,
              :monthly_principal, :interest_rate_monthly, :loan_length_periods, :period, :total_amount,
              :total_interest, :monthly_balance
end

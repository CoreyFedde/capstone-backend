class LoanSerializer < ActiveModel::Serializer
  attributes :id, :name, :lender, :principal, :interest_rate, :loan_length, :start_date, :minimum_monthly_payment, :current_monthly_payment
end

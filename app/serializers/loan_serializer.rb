class LoanSerializer < ActiveModel::Serializer
  attributes :id, :name, :lender, :principal, :interest_rate, :loan_length,
              :start_date, :current_monthly_payment, :monthly_payment, :monthly_interest,
              :monthly_principal, :interest_rate_monthly, :loan_length_periods, :period, :total_amount,
              :total_interest
            #   def principal
            #     object.principal.to_f
            #   end
            #   def interest_rate
            #     object.interest_rate.to_f
            #   end
            #
            # # virtual attribute
            #   def monthly_payment
            #     binding.pry
            #     # interest_rate
            #     # (1 - (1 + interest_rate)**(-1))
            #     # (principal * interest_rate) / (0)
            #     ((principal * interest_rate) / ((1 - (1 + interest_rate)**(-1)).to_f)).to_f
            #   end
end

#Loan
# Manually entered
# Principal (P)
# Interest rate (R)
# Length of loan (L)
# Current Payment (CP) <- Stretch

# Implied
# Minimum Monthly Payment (MP) = (P x R) / [1 - (1 + R)^(-L)
# MP going toward interest (IMP) = MP + (1 + R)^(n-1) x (P x R - MP)
# MP going toward principal (PMP) = MP - IMP
# Total Amount over life of loan (Ta) = (MP x L)
# Total Interest over life of loan (Ti) = (MP x L) - P
# Period (N) = Period of the loan
# Revised loan length (nL) = ??? <- Stretch
# Custom Payment going toward principal (PCP) = PMP + (CP - MP) <- Stretch
# Remaining Balance (Rb) = P - (PMP x N)
# Custom Remaining Balance (CRb) = P - (PCP x N) <- Stretch

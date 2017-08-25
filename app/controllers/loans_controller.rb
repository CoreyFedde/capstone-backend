class LoansController < ProtectedController
  before_action :set_loan, only: [:update, :destroy]

  # GET /loans
  def index
    @loans = current_user.loans.all

    render json: @loans
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    @loan = current_user.loans.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = current_user.loans.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:name, :lender, :principal, :interest_rate, :loan_length, :start_date, :minimum_monthly_payment, :current_monthly_payment)
    end
end
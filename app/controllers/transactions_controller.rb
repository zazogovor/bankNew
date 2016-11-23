class TransactionsController < ApplicationController

  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authorise
  # GET /transactions
  # GET /transactions.json
	def index
		@transactions = []
		@accounts = @current_customer.accounts
		@accounts.each do |account|
			account.transactions.each do |transaction|
				@transactions << transaction
			end
		end
		
		@transactions.sort!
	end

  # GET /transactions/1
  # GET /transactions/1.json
	def show
	end

  # GET /transactions/new
	def new
		@transaction = Transaction.new
	end

  # GET /transactions/1/edit
	def edit
	end
  
	#Method to process a transaction in the database
	#It is meant to deduct the transaction amount from sender, and add the amount to receiver
	def processTransaction(sender, receiver, amount)
		senderAccount = Account.find_by_id(sender)
		receiverAccount = Account.find_by_id(receiver)
		
		senderAccount.balance -= amount
		receiverAccount.balance += amount
	end

  # POST /transactions
  # POST /transactions.json
	def create
		@transaction = Transaction.new(transaction_params)

		respond_to do |format|
		  if @transaction.save
			format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
			format.json { render :show, status: :created, location: @transaction }
		  else
			format.html { render :new }
			format.json { render json: @transaction.errors, status: :unprocessable_entity }
		  end
		end
		
		processTransaction(@transaction.account_id, @transaction.transferee_id, @transaction.amount)
	end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:account_id, :transferee_id, :amount)
    end
end

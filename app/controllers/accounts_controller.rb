class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :employeeauthorise, :only => [:all_accounts]
  before_action :authorise, :except => [:all_accounts]
  

  # GET /accounts
  # GET /accounts.json
  def index
	#@accounts = Account.all
	@accounts = @current_customer.accounts
  end
  
  def all_accounts
	@accounts = Account.all
  end

  def test
	
  end
  # GET /accounts/1
  # GET /accounts/1.json
  def show
	if signed_in?
		@transactions = []
		@accounts = @current_customer.accounts
		@accounts.each do |account|
			account.transactions.each do |transaction|
				@transactions << transaction
			end
		end
		
		@transactions.sort!
	else
		@transactions = []
		@accounts = @accounts = Account.all
		@accounts.each do |account|
			account.transactions.each do |transaction|
				@transactions << transaction
			end
		end
		
		@transactions.sort!
	end
		
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
	@account.customer_id = @current_customer.id

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_type, :balance, :customer_id)
    end
end

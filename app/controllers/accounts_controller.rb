class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def show
  end
  
  def edit
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:notice] = "Account was created successfully"
      redirect_to @account
    else
      render 'new'
    end
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "Account was updated succesfully"
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    flash[:notice] = "Account #{params[:id]} was deleted succesfully"
    redirect_to accounts_path 
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :balance, :description)
  end
end

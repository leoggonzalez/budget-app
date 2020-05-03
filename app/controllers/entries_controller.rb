class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  def index
    @entries = Entry.all
    @accounts = Account.all
  end

  def show
    @entry = Entry.find(params[:id])
    @account = Account.find(@entry[:account_id])
  end

  def new
    @entry = Entry.new
    @accounts = Account.all
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      flash[:notice] = "Entry was created successfully"
      redirect_to @entry
    else
      @accounts = Account.all
      render 'new'
    end
  end

  def edit
    @accounts = Account.all
    @entry = Entry.find(params[:id])
    @entry_type = @entry.ammount >= 0 ? "income" : "expense"
    @entry.ammount = @entry.ammount.abs()
  end

  def update
    if @entry.update(entry_params)
      flash[:notice] = "Entry was updated succesfully"
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    @entry.destroy
    flash[:notice] = "Entry #{params[:id]} was deleted succesfully"
    redirect_to entries_path 
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    parsed_params = params[:entry]
    ammount = parsed_params[:ammount].to_f.abs()
    parsed_params[:ammount] = parsed_params[:type] == "expense" ? ammount * -1  : ammount
    return parsed_params.permit(:ammount, :description, :active_on, :inactive_on, :recurrent, :account_id)
  end
end

class AccountController < ApplicationController
  getter account = Account.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_account }
  end

  def index
    accounts = Account.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    account = Account.new account_params.validate!
    if account.save
      redirect_to action: :index, flash: {"success" => "Created account successfully."}
    else
      flash["danger"] = "Could not create Account!"
      render "new.slang"
    end
  end

  def update
    account.set_attributes account_params.validate!
    if account.save
      redirect_to action: :index, flash: {"success" => "Updated account successfully."}
    else
      flash["danger"] = "Could not update Account!"
      render "edit.slang"
    end
  end

  def destroy
    account.destroy
    redirect_to action: :index, flash: {"success" => "Deleted account successfully."}
  end

  private def account_params
    params.validation do
      required :name { |f| !f.nil? }
    end
  end

  private def set_account
    @account = Account.find! params[:id]
  end
end

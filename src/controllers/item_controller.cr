class ItemController < ApplicationController
  getter item = Item.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_item }
  end

  def index
    items = Item.all
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
    item = Item.new item_params.validate!
    if item.save
      redirect_to action: :index, flash: {"success" => "Created item successfully."}
    else
      flash["danger"] = "Could not create Item!"
      render "new.slang"
    end
  end

  def update
    item.set_attributes item_params.validate!

    if item.save
      redirect_to action: :index, flash: {"success" => "Updated item successfully."}
    else
      flash["danger"] = "Could not update Item!"
      render "edit.slang"
    end
  end

  def destroy
    item.destroy
    redirect_to action: :index, flash: {"success" => "Deleted item successfully."}
  end

  private def item_params
    params.validation do
      required :date { |f| !f.nil? }
      required :description { |f| !f.nil? }
      required :typus { |f| !f.nil? }
      required :amount { |f| !f.nil? }
      required :account_id { |f| !f.nil? }
    end
  end

  private def set_item
    @item = Item.find! params[:id]
  end
end
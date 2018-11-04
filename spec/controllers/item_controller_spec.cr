require "./spec_helper"

def item_hash
  {"date" => "Fake", "description" => "Fake", "typus" => "Fake", "amount" => "1.00"}
end

def item_params
  params = [] of String
  params << "date=#{item_hash["date"]}"
  params << "description=#{item_hash["description"]}"
  params << "typus=#{item_hash["typus"]}"
  params << "amount=#{item_hash["amount"]}"
  params.join("&")
end

def create_item
  model = Item.new(item_hash)
  model.save
  model
end

class ItemControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe ItemControllerTest do
  subject = ItemControllerTest.new

  it "renders item index template" do
    Item.clear
    response = subject.get "/items"

    response.status_code.should eq(200)
    response.body.should contain("items")
  end

  it "renders item show template" do
    Item.clear
    model = create_item
    location = "/items/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Item")
  end

  it "renders item new template" do
    Item.clear
    location = "/items/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Item")
  end

  it "renders item edit template" do
    Item.clear
    model = create_item
    location = "/items/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Item")
  end

  it "creates a item" do
    Item.clear
    response = subject.post "/items", body: item_params

    response.headers["Location"].should eq "/items"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a item" do
    Item.clear
    model = create_item
    response = subject.patch "/items/#{model.id}", body: item_params

    response.headers["Location"].should eq "/items"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a item" do
    Item.clear
    model = create_item
    response = subject.delete "/items/#{model.id}"

    response.headers["Location"].should eq "/items"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end

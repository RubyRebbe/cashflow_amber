require "./spec_helper"

def account_hash
  {"name" => "Fake"}
end

def account_params
  params = [] of String
  params << "name=#{account_hash["name"]}"
  params.join("&")
end

def create_account
  model = Account.new(account_hash)
  model.save
  model
end

class AccountControllerTest < GarnetSpec::Controller::Test
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

describe AccountControllerTest do
  subject = AccountControllerTest.new

  it "renders account index template" do
    Account.clear
    response = subject.get "/accounts"

    response.status_code.should eq(200)
    response.body.should contain("accounts")
  end

  it "renders account show template" do
    Account.clear
    model = create_account
    location = "/accounts/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Account")
  end

  it "renders account new template" do
    Account.clear
    location = "/accounts/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Account")
  end

  it "renders account edit template" do
    Account.clear
    model = create_account
    location = "/accounts/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Account")
  end

  it "creates a account" do
    Account.clear
    response = subject.post "/accounts", body: account_params

    response.headers["Location"].should eq "/accounts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a account" do
    Account.clear
    model = create_account
    response = subject.patch "/accounts/#{model.id}", body: account_params

    response.headers["Location"].should eq "/accounts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a account" do
    Account.clear
    model = create_account
    response = subject.delete "/accounts/#{model.id}"

    response.headers["Location"].should eq "/accounts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end

require "./spec_helper"
require "../../src/models/account.cr"

describe Account do
  Spec.before_each do
    Account.clear
  end
end

require "spec_helper"

# Sample module
module ErrorCode
  SUCCESS = 0
  ERROR   = -1
end

RSpec.describe RspecPrettyMatcher do
  it "has a version number" do
    expect(RspecPrettyMatcher::VERSION).not_to be nil
  end

  it "Success to match" do
    code = ErrorCode::SUCCESS
    expect(code).to const_eq ErrorCode, :SUCCESS
  end

  it "Fail to match" do
    code = ErrorCode::ERROR
    expect(code).to const_eq ErrorCode, :SUCCESS
  end

  it "Fail to match(unknown value)" do
    code = -3
    expect(code).to const_eq ErrorCode, :SUCCESS
  end
end

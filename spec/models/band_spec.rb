require 'spec_helper'

describe Band do
  it "validates presence of name" do
    build(:band, name: "").should have(1).errors_on(:name)
  end

  it "validates uniqueness of name" do
    create(:band, name: "Niall")
    build(:band, name: "Niall").should have(1).errors_on(:name)
  end

  it "validates presence of contact_name" do
    build(:band, contact_name: "").should have(1).errors_on(:contact_name)
  end

  it "validates presence of email" do
    build(:band, email: "").should have(2).errors_on(:email)
  end

  it "validates format of email" do
    build(:band, email: "invalid").should have(1).errors_on(:email)
  end
end

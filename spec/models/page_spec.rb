require 'rails_helper'

RSpec.describe Page, type: :model do
  
  it "is not valid without a url" do
    page = Page.new(url: nil)
    expect(page).to_not be_valid
  end

  it "is valid with a url" do
    page = FactoryGirl.create(:page)
    expect(page).to be_valid
  end
end

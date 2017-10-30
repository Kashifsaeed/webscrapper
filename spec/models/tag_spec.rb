require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  it "is not valid without name, content and page" do
    tag = Tag.new
    expect(tag).to_not be_valid
  end

  it "is valid with a name,content and page" do
    page = FactoryGirl.create(:page)
    tag = FactoryGirl.create(:tag,page: page)
    expect(tag).to be_valid
  end

end

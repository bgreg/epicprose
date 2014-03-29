require 'spec_helper'

describe Category do
  before :all do
    @category = Category.new
  end

  it "should create a new category" do
    @category.should be_an_instance_of( Category )
  end

  it "should not allow saving without a body" do 
    expect{ @category.save }.to change(Category, :count).by(0)
  end

  it "should allow saving with a body" do 
    expect{ 
      @category.body = ValidString.short
      @category.save 
    }.to change(Category, :count).by(1)
  end
end

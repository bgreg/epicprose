require 'spec_helper'

describe Category do
  before :all do
    @category = category.new
  end

  it "should create a new category" do
    @category.should be_an_instance_of( category )
  end

  it "should not allow saving without a body" do 
    expect{ @category.save }.to change(category, :count).by(0)
  end

  it "should allow saving with a body" do 
    expect{ 
      @category.body = ValidString.short
      @category.save 
    }.to change(category, :count).by(1)
  end
end

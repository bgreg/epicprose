require 'spec_helper'

describe Genre do
  before :all do
    @genre = Genre.new
  end

  it "should create a new genre" do
    @genre.should be_an_instance_of( Genre )
  end

  it "should not allow saving without a body" do 
    expect{ @genre.save }.to change(Genre, :count).by(0)
  end

  it "should allow saving with a body" do 
    expect{ 
      @genre.body = short_string
      @genre.save 
    }.to change(Genre, :count).by(1)
  end
end

require 'spec_helper'

describe Chapter do
  before do
    @chapter = Chapter.new
  end

  it "should create a new chapter" do 
    @chapter.should be_an_instance_of( Chapter )
  end

  it "should allow me to save a body attribute of less than 120" do 
    expect {
      @chapter.body = "test"
      @chapter.save
    }.to change(Chapter, :count).by(1)
  end

  it "should not allow me to save a body attribute of more than 120 " do 
    expect {
      @chapter.body = long_string
      @chapter.save
    }.to change(Chapter, :count).by(0)
  end
  it "should not allow me to save a body attribute of less than 2 " do
    expect {
      @chapter.body = '1'
      @chapter.save
    }.to change(Chapter, :count).by(0)
  end
end

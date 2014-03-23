require 'spec_helper'

describe Chapter do
  before :all do
    @chapter = Chapter.new
  end

  it "should create a new chapter" do 
    @chapter.should be_an_instance_of( Chapter )
  end
  
end

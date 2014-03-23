require 'spec_helper'

describe Genre do
  before :all do
    @genre = Genre.new
  end
  it "should create a new genre" do
    @genre.should be_an_instance_of( Genre )
  end
end

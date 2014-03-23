require 'spec_helper'

describe WritingPrompt do
  before :all do 
    @writing_prompt = WritingPrompt.new
  end

  it "should create a new writing prompt instance" do
    @writing_prompt.should be_an_instance_of( WritingPrompt )
  end
end

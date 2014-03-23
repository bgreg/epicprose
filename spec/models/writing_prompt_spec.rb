require 'spec_helper'

describe WritingPrompt do
  before :all do 
    @writing_prompt = WritingPrompt.new
  end

  it "should create a new writing prompt instance" do
    @writing_prompt.should be_an_instance_of( WritingPrompt )
  end

  it "should not allow saving without a body" do 
    expect{ @writing_prompt.save }.to change(WritingPrompt, :count).by(0)
  end

  it "should allow saving with a body" do 
    expect{ 
      @writing_prompt.body = short_string
      @writing_prompt.save 
    }.to change(WritingPrompt, :count).by(1)
  end
end

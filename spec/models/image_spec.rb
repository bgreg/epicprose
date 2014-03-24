require 'spec_helper'

describe Image do
    it "should not save without a picutre_uri" do
      expect{
        image = Image.new
        image.save
      }.to change(Image, :count).by(0)
    end

    it "should not save with a mal-formed url" do
      expect{
        image = Image.new( uri: "test" )
        image.save
      }.to change(Image, :count).by(0)
    end

    it "should return a validation message on malformed urls" do 
      image = Image.new( uri: "rubygemscom" )
      image.save
      expect(image.errors.messages[:uri]).to include("Valid URL is required")
    end
end

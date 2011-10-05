require 'spec_helper'

describe CorporatePage do

  def reset_corporate_page(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @corporate_page.destroy! if @corporate_page
    @corporate_page = CorporatePage.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_corporate_page
  end

  context "validations" do
    
    it "rejects empty title" do
      CorporatePage.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_corporate_page
      CorporatePage.new(@valid_attributes).should_not be_valid
    end
    
  end

end
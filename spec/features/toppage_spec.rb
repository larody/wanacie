require 'spec_helper'

describe "Toppage" do
  before :each do
  end

  it "displays events list" do
    visit '/signup'
    page.should have_content ''
  end
end

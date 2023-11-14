require 'rails_helper'

RSpec.feature "Indexshows", type: :feature do
  context "index" do
    before (:each) do 
      Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0))
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0))
    end

    it "should route correctly from the root" do
      visit '/'
      expect(page.text).to match /PS4.*iPad/
    end

    it "should show listings with default sort order" do
      visit listings_path
      expect(page.text).to match /PS4.*iPad/
    end


    it "should contain a link from listing name to its show page" do
      visit listings_path
      click_on "iPad"
      expect(page.current_path).to eq(listing_path(1))
    end
  end

  context "show" do
    before (:each) do 
      Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0))
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0))
    end

    it "should show listing details" do
      visit listing_path(1)
      expect(page.text).to match(/iPad/)
      expect(page.text).to match(/used/)
    end

    it "should have a link back to the index" do
      visit listing_path(1)
      expect(page.text).to match /Back to index/
      click_on "Back to index"
      expect(page.current_path).to eq(listings_path)
    end

  end
end

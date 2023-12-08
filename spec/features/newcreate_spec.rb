require 'rails_helper'

RSpec.feature "Newcreates", type: :feature do
  context "new" do
    before (:each) do 
      u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
      Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
    end

    it "should call the new method" do
      visit new_listing_path
      expect(page.text).to match /Title.*Description.*Price/
    end

  end

  context "create" do

    before (:each) do 
        u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
        visit new_user_session_path
        fill_in('Email', with: 'cperry@colgate.edu')
        fill_in('Password', with: 'colgate13')
        click_on('Log in')
    end

    it "should create a new listing properly" do
        visit new_listing_path
        fill_in('Title', with: "Sample Title")
        fill_in('Description', with: "Sample Description")
        fill_in('Price', with: "257")
        click_on("Create Listing")
        expect(page.current_path).to eq(listings_path)
        expect(page.text).to match /successfully posted/
    end    

    it "should return an error message if new listing not created properly" do
        visit new_listing_path
        fill_in('Title', with: "Sample Title")
        fill_in('Description', with: "Sample Description")
        click_on("Create Listing")
        expect(page.current_path).to eq(listings_path)
        expect(page.text).to match /Creation failed/
    end
  end
end


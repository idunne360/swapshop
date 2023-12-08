require 'rails_helper'

RSpec.feature "Accept Offer", type: :feature do
  context "acceptoffer" do
    before (:each) do 
      u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
      visit new_user_session_path
      fill_in('Email', with: 'cperry@colgate.edu')
      fill_in('Password', with: 'colgate13')
      click_on('Log in')

      l1 = Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), user: u4)

      Comment.create!(commentText: "Comment", offer: 200, user: u4, listing: l1)
      
    end

    it "should be able to accept offer and delete listing" do
      visit listing_path(1)
      click_on("Accept Offer")
      expect(page.current_path).to eq(listings_path)
      expect(page.text).to match /Offer accepted. Listing sold!/
      
    end

  

  end
end


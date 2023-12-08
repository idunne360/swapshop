require 'rails_helper'

RSpec.feature "Destroys", type: :feature do
  context "destroy" do
    before (:each) do 
      u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
      visit new_user_session_path
      fill_in('Email', with: 'cperry@colgate.edu')
      fill_in('Password', with: 'colgate13')
      click_on('Log in')

      Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
    end

    it "should destroy listings" do
      visit listing_path(1)
      click_on("Delete listing")
      expect(page.current_path).to eq(listings_path)
      expect(page.text).to match /Listing iPad deleted/
      
    end

  

  end
end


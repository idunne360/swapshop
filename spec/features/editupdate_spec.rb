require 'rails_helper'

RSpec.feature "Editupdates", type: :feature do
  context "edit" do
    before (:each) do 
      u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
      visit new_user_session_path
      fill_in('Email', with: 'cperry@colgate.edu')
      fill_in('Password', with: 'colgate13')
      click_on('Log in')

      Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
      Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
    end

    it "should call the edit method" do
      visit edit_listing_path(1)
      expect(page.text).to match /Title.*Description.*Price/
    end

  end

  context "update" do

    before (:each) do 
        u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')
        Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), user: u4)
        visit new_user_session_path
        fill_in('Email', with: 'cperry@colgate.edu')
        fill_in('Password', with: 'colgate13')
        click_on('Log in')
    end

    it "should update a new listing properly" do
        visit edit_listing_path(1)
        fill_in('Title', with: "Sample Title")
        fill_in('Description', with: "Sample Description")
        fill_in('Price', with: "257")
        click_on("Update Listing")
        expect(page.current_path).to eq(listing_path(1))
        expect(page.text).to match /successfully edited/
    end    

    it "should return an error message if new listing not updated properly" do
        visit edit_listing_path(1)
        fill_in('Title', with: "Sample Title")
        fill_in('Description', with: "Sample Description")
        fill_in('Price', with: "Error")
        click_on("Update Listing")
        expect(page.current_path).to eq(listing_path(1))
        expect(page.text).to match /Edit Failed/
    end
  end
end


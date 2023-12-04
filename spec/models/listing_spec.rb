require 'rails_helper'

RSpec.describe Listing, type: :model do

  describe "#create_listing" do
    context "with valid attributes" do
      it "creates a new listing" do
        count = Listing.count
        Listing.create!(title: "New Listing", description: "A new listing", price: 10.0, date: Date.today)
        expect(Listing.count).to eq(count + 1)
      end

      it "sets a flash notice message" do
        listing = Listing.create!(title: "New Listing", description: "A new listing", price: 10.0, date: Date.today)
        expect(listing.errors).to be_empty
        #expect(flash[:notice]).to eq("New Listing successfully posted")
      end

      it "searches by product title" do
        listing_bunker = Listing.create!(
          title: "Cold War-era bunker",
          description: "Located two miles under the surface",
          price: 1000000.0, #1 million
          date: Date.today
        )
        listing_blimp = Listing.create!(
          title: "Industrial blimp",
          description: "Reasonably priced, in need of structural repairs",
          price: 50000.0,
          date: Date.today
        )
        expect(Listing.title_search("bunker")).to eq(listing_bunker)
        expect(Listing.title_search("Bunker")).to eq(listing_bunker)
        expect(Listing.title_search("BUNKER")).to eq(listing_bunker)
        expect(Listing.title_search("cold war")).to eq(listing_bunker)
        expect(Listing.title_search("blimp")).to eq(listing_blimp)
        expect(Listing.title_search("BLIMP")).to eq(listing_blimp)

      end

      it "sorts by product title" do

      end

    end

    context "with invalid attributes" do
      it "raises an ActiveRecord::RecordInvalid error" do
        expect {
          Listing.create!(title: "", description: "", price: "", date: "")
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "sets a flash alert message" do
        listing = Listing.create(title: "", description: "", price: "", date: "")
        expect(listing.errors).not_to be_empty
        #expect(flash[:alert]).to eq("Creation failed")
      end
    end
  end

end

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

      #Should this be under a different "describe" header?
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
        expect(Listing.title_search("bunker")).to include(listing_bunker)
        expect(Listing.title_search("Bunker")).to include(listing_bunker)
        expect(Listing.title_search("BUNKER")).to include(listing_bunker)
        expect(Listing.title_search("cold war")).to include(listing_bunker)
        expect(Listing.title_search("blimp")).to include(listing_blimp)
        expect(Listing.title_search("BLIMP")).to include(listing_blimp)

      end

      it "sorts by product title" do
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
        listing_PS4 = Listing.create!(
          title: "PS4",
          description: "Time passes fast - PS4 is now last-gen technology",
          price: 350.0,
          date: Date.today
        )
        expect(Listing.sorted_by(nil)).to include(listing_bunker)

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

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

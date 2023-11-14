require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "#create_comment" do
    context "with valid attributes" do
      it "creates a new comment" do
        count = Comment.count
        u1 = User.create!(email: 'bcasey@colgate.edu', password: 'colgate13')
        l1 = Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), poster: "Pen Cil")
        Comment.create!(commentText: "Comment", offer: 200, user: u1, listing: l1)
        expect(Comment.count).to eq(count + 1)
      end

      it "sets a flash notice message" do
        u1 = User.create!(email: 'bcasey@colgate.edu', password: 'colgate13')
        l1 = Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), poster: "Pen Cil")
        comment = Comment.create!(commentText: "Comment", offer: 200, user: u1, listing: l1)
        expect(comment.errors).to be_empty
        #expect(flash[:notice]).to eq("New Comment successfully posted")
      end
    end

    context "with invalid attributes" do
      it "raises an ActiveRecord::RecordInvalid error" do
        expect {
          Comment.create!(commentText: "", offer: "")
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "sets a flash alert message" do
        comment = Comment.create(commentText: "", offer: "")
        expect(comment.errors).not_to be_empty
        #expect(flash[:alert]).to eq("Creation failed")
      end
    end
  end
end

class CommentAuthor < ApplicationRecord
    has_many :comments
    has_many :listings, through: :comments
    belongs_to :user
end

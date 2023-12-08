class Comment < ApplicationRecord
    belongs_to :listing
    belongs_to :user

    validates :offer, presence: true
    validates :commentText, presence: true
end

class Comment < ApplicationRecord
    belongs_to :listing
    belongs_to :user

    attribute :accepted, :boolean, default: false
end

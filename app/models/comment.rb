class Comment < ApplicationRecord
    belongs_to :listing
    belongs_to :comment_author
end

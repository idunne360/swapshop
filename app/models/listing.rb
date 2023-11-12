class Listing < ApplicationRecord

  has_many :comments

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    
    
    def self.title_search(string)
        Listing.where("title like ?", "%#{string}%")
    end

    def self.sorted_by(field)
        if !Listing.column_names.include?(field)
          Listing.order('date')
        else
          return Listing.order(field)
        end
      end
end

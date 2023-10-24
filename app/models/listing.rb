class Listing < ApplicationRecord
    
    
    
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

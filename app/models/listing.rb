class Listing < ApplicationRecord
    
    
    def self.title_search(string)
        Listing.where("title like ?", "%#{string}%")
    end

    def self.sorted_by(field)
      field = 'title' if field.nil? || !column_names.include?(field.to_s)
      order(field)
    end

    #def self.search_by_name(search_term)
    #  where('lower(name) LIKE ?', "%#{search_term.downcase}%")
    #end



end

class Listing < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    
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

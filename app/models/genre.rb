class Genre < ActiveRecord::Base
  has_many :book_genre_relations
  has_many :books, :through => :book_genre_relations
end

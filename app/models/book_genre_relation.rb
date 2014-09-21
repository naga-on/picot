class BookGenreRelation < ActiveRecord::Base
  belongs_to :book
  belongs_to :genre
end

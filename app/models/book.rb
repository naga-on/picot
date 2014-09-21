class Book < ActiveRecord::Base
  has_many :volumes
  validates_presence_of :title, :author

  def thumbnail
    volume = self.volumes.first
    return nil if volume.nil?
    volume.thumbnail
  end
end


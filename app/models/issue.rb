class Issue < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100"}
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def image_url
    image.url(:medium)
  end

  def in_area area
    self.nearbys(area)
  end

  def distance lat, lng
    self.distance_from([lat, lng])
  end
end

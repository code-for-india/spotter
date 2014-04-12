require 'tempfile'
class Issue < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100"}
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def image_thumb
    image.url(:thumb)
  end

  def image_medium
    # we do not send large images yet. At the most, a medium sized.
    image.url(:medium)
  end

  def self.in_area lat, lng, area
    Issue.near([lat, lng], area)
  end

  def distance lat, lng
    self.distance_from([lat, lng])
  end

  def add_image image
    image_file = Base64.decode64(image)
    file = Tempfile.new(["test", ".jpg"])
    begin
      file.binmode
      file.write image_file

      self.image = file
    ensure
      file.close
      file.unlink
    end
  end
end

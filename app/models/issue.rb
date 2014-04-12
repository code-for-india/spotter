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
    decoded_data = Base64.decode64(image)
    data = StringIO.new decoded_data

    data.class_eval do
      attr_accessor :content_type, :original_filename
    end

    data.content_type = "image/png"
    data.original_filename = File.basename("file.png")

    self.image = data
  end
end

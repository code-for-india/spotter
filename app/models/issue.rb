class Issue < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100"}

  def image_url
    image.url(:medium)
  end

  def distance lat, lng
    rad_per_deg = Math::PI / 180
    rkm = 6371
    rm = rkm * 1000

    dlon_rad = (self.logitude - lng) * rad_per_deg
    dlat_rad = (self.latitude - lat) * rad_per_deg

    lat_rad = lat * rad_per_deg
    lng_rag = lng * rad_per_deg

    a = Math.sin(dlat_rad/2)**2
    + Math.cos(lat_rad) * Math.cos(self.latitude * rad_per_deg) * Math.sin(dlon_rad/2)**2

    distance = 2 * Math.sin(Math.sqrt(a)) * rm
  end
end

class Condition < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validate :image_type

  private

  def image_type
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:images, 'はjpegまたはpng形式である必要があります')
        end
      end
    end
  end
end

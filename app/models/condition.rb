class Condition < ApplicationRecord
  belongs_to :patient
  belongs_to :recorder, class_name: 'User'
  has_many_attached :images

  validate :image_type

  def input_day=(value)
    if value.is_a?(String)
      super(Time.zone.parse(value))
    else
      super(value)
    end
  end

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
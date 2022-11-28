# frozen_string_literal: true

module BrandsHelper
  def image_view(brand)
    if brand.photo.nil?
      image_tag('no-image.jpeg', size: '500x250', alt: 'Brand Image', class: ' w-100 rounded-top')
    else
      image_tag(brand.photo, size: '500x250', alt: 'Brand Image', class: ' w-100 rounded-top')
    end
  end
end

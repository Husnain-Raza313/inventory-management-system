# frozen_string_literal: true

module BrandsHelper
  def image_view(brand)
    if brand.image.filename.nil?
      image_tag('no-image.jpeg', size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Brand'), class: ' w-100 rounded-top')
    else
      image_tag(brand.image, size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Brand'), class: ' w-100 rounded-top')
    end
  end
end

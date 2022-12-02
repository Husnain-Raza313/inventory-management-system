# frozen_string_literal: true

module ApplicationHelper
  IMAGE_SIZE = '500x250'
  def image_view(obj)
    if obj.image.filename.nil?
      image_tag('no-image.jpeg', size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Brand'),
                                 class: ' w-100 rounded-top')
    else
      image_tag(obj.image, size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Brand'),
                           class: ' w-100 rounded-top')
    end
  end
end

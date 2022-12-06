# frozen_string_literal: true

module ApplicationHelper
  IMAGE_SIZE = '500x250'
  def image_view(obj)
    if obj.image.attached?
      return image_tag(obj.image, size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                                  class: ' w-100 rounded-top')
    end

    image_tag('no-image.jpeg', size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                               class: ' w-100 rounded-top')
  end
end

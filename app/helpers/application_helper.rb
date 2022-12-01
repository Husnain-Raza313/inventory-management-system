# frozen_string_literal: true

module ApplicationHelper

  IMAGE_SIZE = ('500x250').freeze
  def image_view(obj)
    return image_tag(obj.image, size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: "#{obj.class.name}"), class: ' w-100 rounded-top') if obj.image.attached?

    image_tag('no-image.jpeg', size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: "#{obj.class.name}"), class: ' w-100 rounded-top')
  end
end

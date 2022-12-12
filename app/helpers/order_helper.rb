module OrderHelper
  IMAGE_SIZE = '120x120'
  def product_image(obj)
    if obj.image.attached?
      return image_tag(obj.image, size: OrderHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                                  class: ' w-100 rounded-top')
    end

    image_tag('no-image.jpeg', size: OrderHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                               class: ' w-100 rounded-top')
  end
end

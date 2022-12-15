# frozen_string_literal: true

module OrdersHelper
  IMAGE_SIZE = '120x120'
  def product_image(obj)
    if obj.image.attached?
      return image_tag(obj.image, size: OrdersHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                                  class: ' w-100 rounded-top')
    end

    image_tag('no-image.jpeg', size: OrdersHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                               class: ' w-100 rounded-top')
  end

  def total_price(item = nil)
    unless item.nil?
      total=item.retail_price*session[item.id]
      session[:total_order_price]= session[:total_order_price] + total
      return total
    else
      session[:total_order_price] = 0
    end
  end
end

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
    if item.blank?
      session[:total_order_price] = 0
    else
      total = item.retail_price * order_item_quantity(item.id)
      session[:total_order_price] = session[:total_order_price] + total
      total
    end
  end

  def check_order_array(product)
    session[:order_array].include?(product.id.to_s)
  end

  def submit_btn_name(request)
    request === 'create' ? t('add', param: 'Order') : t('update-button', param: 'Order')
  end

  def quantity_value(request, item)
    request === 'create' ? 1 : order_item_quantity(item.id).to_i
  end

  def check_disabled(request)
    !(request === 'create')
  end
end

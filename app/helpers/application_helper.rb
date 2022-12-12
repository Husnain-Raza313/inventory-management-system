# frozen_string_literal: true

module ApplicationHelper
  IMAGE_SIZE = '500x100'
  SHOW_IMAGE_SIZE = '500x260'
  def image_view(obj, image_size = nil)
    image_tag(obj.image.attached? ? obj.image : 'no-image.jpeg', size: image_size || ApplicationHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                                                                 class: ' w-100 rounded-top image-file')
  end

  def current_order
    if Order.find_by_id(session[:order_id]).nil?
      Order.new(user_id: current_user.id)
    else
      Order.find_by_id(session[:order_id])
    end
  end
end

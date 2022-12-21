# frozen_string_literal: true

module ApplicationHelper
  IMAGE_SIZE = '500x100'
  SHOW_IMAGE_SIZE = '500x260'
  def image_view(obj, image_size = nil)
    image_tag(obj.image.attached? ? obj.image : 'no-image.jpeg', size: image_size || ApplicationHelper::IMAGE_SIZE, alt: t('image', param: obj.class.name.to_s),
                                                                 class: ' w-100 rounded-top image-file')
  end

  def order_item_quantity(id)
    session["quantity_id_#{id}"]
  end
end

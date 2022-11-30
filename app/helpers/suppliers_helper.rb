module SuppliersHelper
  def image_view(supplier)
    if supplier.image.filename.nil?
      image_tag('no-image.jpeg', size: '500x250', alt: 'Supplier Image', class: ' w-100 rounded-top')
    else
      image_tag(supplier.image, size: '500x250', alt: 'Supplier Image', class: ' w-100 rounded-top')
    end
  end
end

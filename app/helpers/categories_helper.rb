module CategoriesHelper
  def image_view(category)
    if category.image.filename.nil?
      image_tag('no-image.jpeg', size: '500x250', alt: 'Category Image', class: ' w-100 rounded-top')
    else
      image_tag(category.image, size: '500x250', alt: 'Category Image', class: ' w-100 rounded-top')
    end
  end
end

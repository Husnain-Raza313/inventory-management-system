module CategoriesHelper
  def image_view(category)
    if category.image.filename.nil?
      image_tag('no-image.jpeg', size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Category'),
                                 class: ' w-100 rounded-top')
    else
      image_tag(category.image, size: ApplicationHelper::IMAGE_SIZE, alt: t('image', param: 'Category'),
                                class: ' w-100 rounded-top')
    end
  end
end

# frozen_string_literal: true

module ProductsHelper
  def categories
    Category.all.map { |c| [c.name, c.id] }
  end

  def suppliers
    Supplier.all.map { |s| [s.name, s.id] }
  end

  def brands
    Brand.all.map { |p| [p.name, p.id] }
  end

  def check_user_role
    current_user.has_role?(:admin)
  end
  def check_products_path
    check_user_role ? products_path : orders_path
  end
end

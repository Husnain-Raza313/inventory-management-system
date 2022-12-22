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
end

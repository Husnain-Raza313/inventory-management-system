module ProductsHelper
  def all_categories
    Category.all.map { |c| [c.name, c.id] }
  end

  def all_suppliers
    Supplier.all.map { |s| [s.name, s.id] }
  end

  def all_brands
    Brand.all.collect { |p| [p.name, p.id] }
  end
end

#encoding: utf-8
unless Category.any?
  Product.all.each do |p|
    if p.parent_id.present? and p.parent.type == "Product"
      p.update_attribute :type, "Section"
    end
  end
  position = -1
  ['Cursos de inglés', 'Cursos de inglés online', 'Inglés para empresas'].each do |title|
    Category.create :title => title, :deletable => false, :position => (position +1)
  end
  Product.all.each do |p| 
    p.update_attribute :parent_id, Category.first.id
  end
end
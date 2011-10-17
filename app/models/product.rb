class Product < Page
  has_and_belongs_to_many :facets, :join_table => "facets_products", :foreign_key => "product_id"
end

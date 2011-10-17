class Facet < Page
  has_and_belongs_to_many :products, :join_table => "facets_products", :foreign_key => "facet_id"
end
class Product < Page
  has_and_belongs_to_many :facets, :join_table => "facets_products", :foreign_key => "product_id"
  attr_accessible :facet_tokens
  attr_reader :facet_tokens
  def facet_tokens=(ids)
    self.facet_ids = ids.split(",")
  end
  def as_json(options={})
    { :id => self.id, :name => self.title }
  end
end

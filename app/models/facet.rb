class Facet < Page
  has_and_belongs_to_many :products, :join_table => "facets_products", :foreign_key => "facet_id"
  attr_accessible :product_tokens, :set
  attr_reader :product_tokens
  scope :age, where(:set => 'age')
  scope :kind, where(:set => 'kind')
  scope :interest, where(:set => 'interest')
  def product_tokens=(ids)
    self.product_ids = ids.split(",")
  end

  def as_json(options={})
    { :id => self.id, :name => self.title }
  end

end
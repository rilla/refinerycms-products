class AddFacets < ActiveRecord::Migration
  def self.up
    create_table :facets_products, :id => false do |t|
      t.integer :facet_id
      t.integer :product_id
    end
    load(Rails.root.join('db', 'seeds', 'facets.rb'))
  end

  def self.down
    drop_table :facets_products
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "facets"})
    end
  end
end
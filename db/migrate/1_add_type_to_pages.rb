class AddTypeToPages < ActiveRecord::Migration
  def self.up
    add_column ::Page.table_name, :type, :string
    load(Rails.root.join('db', 'seeds', 'products.rb'))
  end

  def self.down
    remove_column ::Page.table_name, :type, :string
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "products"})
    end
  end
end
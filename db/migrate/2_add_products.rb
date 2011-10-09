class AddProducts < ActiveRecord::Migration
  def self.up
    unless column_exists? ::Page.table_name, :type
      add_column ::Page.table_name, :type, :string
    end
    load(Rails.root.join('db', 'seeds', 'products.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "products"})
    end
  end
end
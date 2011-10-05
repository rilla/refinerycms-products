class AddCorporatePages < ActiveRecord::Migration

  def self.up
    unless column_exists? ::Page.table_name, :type
      add_column ::Page.table_name, :type, :string
    end
    load(Rails.root.join('db', 'seeds', 'corporate_pages.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "corporate_pages"})
    end
  end

end

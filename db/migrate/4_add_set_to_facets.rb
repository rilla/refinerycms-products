class AddSetToFacets < ActiveRecord::Migration
  def self.up
    add_column :pages, :set, :string
    RefinerySetting.set :facet_sets, ['age', 'kind', 'interest'].to_yaml
  end

  def self.down
    remove_column :pages, :set
    RefinerySetting.delete :facet_sets
  end
end
module Admin
  class ProductsController < Admin::PagesController

    crudify :product,
            :conditions => nil,
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false

  end
end

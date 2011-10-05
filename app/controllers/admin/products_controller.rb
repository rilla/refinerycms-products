module Admin
  class ProductsController < Admin::PagesController

    crudify :page,
            :conditions => 'pages.type = "Product"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false

  end
end

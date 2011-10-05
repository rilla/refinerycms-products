module Admin
  class CorporatePagesController < Admin::PagesController
    crudify :page,
            :conditions => 'pages.type = "CorporatePage"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false
  end
end

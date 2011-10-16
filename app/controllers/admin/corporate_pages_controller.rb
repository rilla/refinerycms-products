module Admin
  class CorporatePagesController < Admin::PagesController
    
    crudify :page,
            :conditions => 'pages.type = "CorporatePage"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false
    def new
      @page = CorporatePage.new
      render :layout => false
    end
    
    def create
      # Set this object as last object, given the conditions of this class.
      params[:page].merge!({
        :position => ((CorporatePage.maximum(:position) ||-1) + 1)
      })

      if (@page = CorporatePage.create(params[:page])).valid?
        flash.now.notice = t(
          'refinery.crudify.created',
          :what => "'#{@page.title}'"
        )
        render :js => "parent.window.location = '#{admin_corporate_pages_url}';"
      else
        render do |page| 
          message = "Ha habido errores:\n"
          message << @page.errors.full_messages.map{|e| "- #{e}"}.join("\n")
          page.alert(message)
        end
      end
    end

  end
end

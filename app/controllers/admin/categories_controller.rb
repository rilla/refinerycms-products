module Admin
  class CategoriesController < Admin::PagesController
    crudify :page,
            :conditions => 'pages.type = "Category"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false
    def new
      @page = Category.new
      render :layout => false
    end

    def create
      # Set this object as last object, given the conditions of this class.
      params[:page].merge!({
        :position => ((Category.maximum(:position) ||-1) + 1)
      })

      if (@page = Category.create(params[:page])).valid?
        flash.now.notice = t(
          'refinery.crudify.created',
          :what => "'#{@page.title}'"
        )
        render :js => "parent.window.location = '#{admin_categories_url}';"
      else
        render do |page| 
          message = "Ha habido errores:\n"
          message << @page.errors.full_messages.map{|e| "- #{e}"}.join("\n")
          page.alert(message)
        end
      end
    end

    def destroy
      @page = Category.find params[:id]
      @page.destroy
    end

    def children
      @page = find_page
      render :layout => false
    end

  end
end
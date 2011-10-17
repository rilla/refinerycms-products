module Admin
  class ProductsController < Admin::PagesController

    crudify :page,
            :conditions => 'pages.type = "Product"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false

    def new
      @page = Product.new
      render :layout => false
    end
    
    def create
      # Set this object as last object, given the conditions of this class.
      params[:page].merge!({
        :position => ((Product.maximum(:position) ||-1) + 1)
      })

      if (@page = Product.create(params[:page])).valid?
        flash.now.notice = t(
          'refinery.crudify.created',
          :what => "'#{@page.title}'"
        )
        render :js => "parent.window.location = '#{admin_products_url}';"
      else
        render do |page| 
          message = "Ha habido errores:\n"
          message << @page.errors.full_messages.map{|e| "- #{e}"}.join("\n")
          page.alert(message)
        end
      end
    end

    def destroy
      @page = Product.find params[:id]
      @page.destroy
    end
  end
end

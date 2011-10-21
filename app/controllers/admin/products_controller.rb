module Admin
  class ProductsController < Admin::PagesController

    crudify :page,
            :conditions => 'pages.type = "Product"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false

    def index
      unless searching?
        # @categories = Category.all
        @pages = Category.all# :group => "parent_id"
      else
        # @categories = Category.all
        # @categories = @categories.products.with_query(params[:search])
      end
    end

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

    def tokens
      @products = Product.with_globalize.where("title like ? and parent_id is null", "%#{params[:q]}%")
      respond_to do |format|
        format.json { render :json => @products }
      end
    end

    def children
      @page = find_page
      render :layout => false
    end
  end
end

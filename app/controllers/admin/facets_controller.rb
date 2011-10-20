module Admin
  class FacetsController < Admin::PagesController

    crudify :page,
            :conditions => 'pages.type = "Facet"',
            :order => "lft ASC",
            :include => [:slugs, :translations, :children],
            :paging => false

    def new
      @page = Facet.new
      render :layout => false
    end

    def create
      # Set this object as last object, given the conditions of this class.
      params[:page].merge!({
        :position => ((Facet.maximum(:position) ||-1) + 1)
      })

      if (@page = Facet.create(params[:page])).valid?
        flash.now.notice = t(
          'refinery.crudify.created',
          :what => "'#{@page.title}'"
        )
        render :js => "parent.window.location = '#{admin_facets_url}';"
      else
        render do |page| 
          message = "Ha habido errores:\n"
          message << @page.errors.full_messages.map{|e| "- #{e}"}.join("\n")
          page.alert(message)
        end
      end
    end
    
    def destroy
      @page = Facet.find params[:id]
      @page.destroy
    end
    
    def tokens
      @facets = Facet.with_globalize.where("title like ?", "%#{params[:q]}%")
      respond_to do |format|
        format.json { render :json => @facets }
      end
    end
  end
end

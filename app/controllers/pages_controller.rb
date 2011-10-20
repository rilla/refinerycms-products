class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show

      @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

      if @page.type == "Facet"
        @products = @page.products
        @facets = @page.children.empty? ? @page.parent.children : @page.children
        #@products.map{ |product| product.facets }.flatten.uniq.reject{ |f| facet_ids.include?(f.id) }
        # if @facets.empty?
        #   @products = Sunspot.search(Product){ with(:facet_ids).all_of [facet_ids.first] }.results
        #   @facets = @products.map{ |product| product.facets }.flatten.uniq
        # end
      elsif @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
        # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
        if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').live.first).present?
          redirect_to first_live_child.url and return
        elsif @page.link_url.present?
          redirect_to @page.link_url and return
        end
      else
        error_404
      end

  end

end

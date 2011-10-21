require 'refinerycms-base'
require 'render_inheritable'

module Refinery
  module Catalog

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      refinery.after_inclusion do
        ::Admin::PagesController.class_eval do
          render_inheritable
        end
      end

      def self.register(tab)
        tab.name = "architecture"
        tab.partial = "/admin/pages/tabs/architecture"
      end

      config.after_initialize do
        ::Refinery::Pages::Tab.register do |tab|
          register tab
        end
        Refinery::Plugin.register do |plugin|
          plugin.name = "products"
          plugin.pathname = root
          plugin.activity = {
            :class => Product,
            :title => 'title'
          }
        end
        Refinery::Plugin.register do |plugin|
          plugin.name = "corporate_pages"
          plugin.pathname = root
          plugin.activity = {
            :class => CorporatePage
          }
        end  
        Refinery::Plugin.register do |plugin|
          plugin.name = "facets"
          plugin.pathname = root
          plugin.activity = {
            :class => Facet
          }
        end
      end
    end
  end
end

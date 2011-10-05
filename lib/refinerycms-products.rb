require 'refinerycms-base'
require 'render_inheritable'

module Refinery
  module Products

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

      config.after_initialize do
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
      end
    end
  end
end

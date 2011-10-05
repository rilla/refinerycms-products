module NavigationHelpers
  module Refinery
    module CorporatePages
      def path_to(page_name)
        case page_name
        when /the list of corporate_pages/
          admin_corporate_pages_path

         when /the new corporate_page form/
          new_admin_corporate_page_path
        else
          nil
        end
      end
    end
  end
end

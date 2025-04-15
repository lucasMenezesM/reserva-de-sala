require 'will_paginate'

module WillPaginate
  module ActiveRecord
    module RelationMethods
      # Permite que o rails_admin use `.per`
      def per(num)
        per_page(num)
      end
    end
  end
end

# Também funciona com arrays (caso use paginates_per com arrays no futuro)
module WillPaginate
  module CollectionMethods
    def per(num)
      per_page(num)
    end
  end
end

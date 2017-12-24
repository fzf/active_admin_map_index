require "activeadmin"
require "active_admin_map_index/version"
require "active_admin_map_index/configuration"
require "active_admin_map_index/engine"
require "active_admin_map_index/index_as_map"

module ActiveAdminMapIndex
  class << self
    def configure
      yield config
    end

    def config
      @config ||= ActiveAdminMapIndex::Configuration.new
    end
  end
end

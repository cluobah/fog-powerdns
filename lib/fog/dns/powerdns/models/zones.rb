# frozen_string_literal: true

require 'fog/core/collection'
require 'fog/dns/powerdns/models/zone'

module Fog
  module DNS
    class PowerDNS
      class Zones < Fog::Collection
        model Fog::DNS::PowerDNS::Zone

        DEFAULT_SERVER = 'localhost'
        
        # attribute :zone,    :aliases => 'name'

        def all
          clear
          data = service.list_zones(DEFAULT_SERVER)
          load(data)
        end

        def get(zone)
          data = service.get_zone(DEFAULT_SERVER, zone).body['zone']
          zone = new(data)
          zone
        rescue Fog::Service::NotFound
          puts 'help!'
        end
      end
    end
  end
end

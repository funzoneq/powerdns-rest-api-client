require 'httparty'
require 'json'

# A class to interact with the PowerDNS REST API
# https://doc.powerdns.com/md/httpapi/api_spec/
class PdnsRestApiClient
  include HTTParty
  attr_accessor :base_uri

  def initialize(base_uri, api_key)
    self.class.base_uri base_uri

    self.class.headers 'X-API-Key' => api_key

    @api_key = api_key
  end

  def servers
    self.class.get('/servers')
  end

  def server(server_id)
    self.class.get("/servers/#{server_id}")
  end

  def config(server_id)
    self.class.get("/servers/#{server_id}/config")
  end

  def setting(server_id, config_setting_name)
    self.class.get("/servers/#{server_id}/config/#{config_setting_name}")
  end

  def zones(server_id = 'localhost')
    self.class.get("/servers/#{server_id}/zones")
  end

  def zone(zone_id, server_id = 'localhost')
    self.class.get("/servers/#{server_id}/zones/#{zone_id}")
  end

  def create_zone(domain, nsServers = [], kind = 'Native', masters = [], server_id = 'localhost')
    zone = { name: domain, kind: kind, masters: masters, nameservers: nsServers }

    self.class.post("/servers/#{server_id}/zones", body: zone.to_json)
  end

  def notify(zone_id, server_id = 'localhost')
    self.class.put("/servers/#{server_id}/zones/#{zone_id}/notify")
  end

  def axfr_retrieve(zone_id, server_id = 'localhost')
    self.class.put("/servers/#{server_id}/zones/#{zone_id}/axfr-retrieve")
  end

  def zone_export(zone_id, server_id = 'localhost')
    self.class.get("/servers/#{server_id}/zones/#{zone_id}/export")
  end

  def search_log(search_term, server_id = 'localhost')
    self.class.get("/servers/#{server_id}/search-log", query: { q: search_term })
  end

  def stats(server_id = 'localhost')
    self.class.get("/servers/#{server_id}/statistics")
  end

  # def trace(server_id = 'localhost')
  #  self.class.get("/servers/#{server_id}/trace")
  # end

  # def zone_check(zone_id, server_id = 'localhost')
  #  self.class.get("/servers/#{server_id}/zones/#{zone_id}/check")
  # end
end

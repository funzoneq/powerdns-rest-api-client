# powerdns-rest-api-client
A ruby library to interact with the experimental PowerDNS REST API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'powerdns_rest_api_client'
```

And then execute:

```
$ bundle
```

Or install it yourself:

```
$ gem install powerdns_rest_api_client
```

## Usage

Enable the [REST API on PowerDNS](https://doc.powerdns.com/md/httpapi/api_spec/) with this snippet:

```
webserver-address=127.0.0.1
webserver-allow-from=127.0.0.0/8
webserver-port=8081
webserver=yes
#
experimental-api-key=supersecretapikey
experimental-json-interface=yes
```

You can now communicate with the server:

```ruby
p = PdnsRestApiClient.new('http://localhost:8081', 'supersecretapikey')
```

Create a zone:

```ruby
p.create_zone('example.org', ['ns0.example.org', 'ns1.example.org'])
```

Get & modify a zone:

```ruby
zone = p.zone('example.org')

zone['records'] << {"name"=>"example.org", "type"=>"TXT", "ttl"=>3600, "disabled"=>false, "content"=>"blablabla"}
zone['records'] << {"name"=>"sub.example.org", "type"=>"A", "ttl"=>3600, "disabled"=>false, "content"=>"10.0.0.1"}
zone['records'] << {"name"=>"sub.example.org", "type"=>"AAAA", "ttl"=>3600, "disabled"=>false, "content"=>"2001:DB8::1"}

p.modify_zone(zone)
```

Delete the zone:

```ruby
p.delete_zone('example.org')
```
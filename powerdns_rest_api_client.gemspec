Gem::Specification.new do |s|
  s.name          = 'powerdns_rest_api_client'
  s.version       = '1.0.0'
  s.authors       = ['Arnoud Vermeer']
  s.email         = ['a.vermeer@freshway.biz']
  s.license       = 'Apache'
  s.summary       = 'PowerDNS REST API client for Ruby'
  s.description   = 'PowerDNS REST API client for Ruby.'
  s.homepage      = 'https://github.com/funzoneq/powerdns-rest-api-client'

  s.files         = `git ls-files`.split("\n")

  s.add_runtime_dependency 'httparty', '~> 0.8.3'

  s.add_development_dependency 'rspec', '~> 3.3.0'
  s.add_development_dependency 'webmock', '~> 1.22.2'
  s.add_development_dependency 'rubocop', '~> 0.32.1'
  s.add_development_dependency 'rake', '~> 10.4.2'
end

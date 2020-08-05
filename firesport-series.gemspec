# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'firesport-series'
  s.version     = '0.0.0'
  s.date        = '2017-04-27'
  s.summary     = 'Feuerwehrsport-Wettkampfserien'
  s.description = 'Konfigurationen für Feuerwehrsport-Wettkampfserien'
  s.authors     = ['Georg Limbach']
  s.email       = 'georf@georf.de'
  s.files       = Dir['{lib,doc,test}/**/*', 'README*']
  s.homepage    = 'https://feuerwehrsport-statistik.de'
  s.license     = 'MIT'

  s.add_dependency 'firesport'
end

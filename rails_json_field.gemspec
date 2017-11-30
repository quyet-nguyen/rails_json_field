# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_json_field/version'

Gem::Specification.new do |s|
  s.name          = 'rails_json_field'
  s.version       = RailsJsonField::VERSION
  s.summary       = "A rails form helper for json fields."
  s.description   = "Allows the user to fillout a JSON database field in a friendly way by providing text inputs for keys and values along with Add and Remove controls.  Currently requires jQuery, but this dependency will be removed in a future version."
  s.authors       = ["Jeremy Dye"]
  s.email         = 'dyeje@mail.gvsu.edu'
  s.homepage      = 'https://github.com/dyeje/rails_json_field'
  s.license       = 'MIT'
  s.files         = Dir['{app, config, db, lib}/**/*']
  s.require_paths = ['lib']

  s.add_development_dependency 'rails'
end

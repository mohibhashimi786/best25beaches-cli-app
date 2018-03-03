# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_25_beaches/version"

Gem::Specification.new do |spec|
  spec.name          = "best_25_beaches"
  spec.version       = Best25Beaches::VERSION
  spec.authors       = ["Mohib Hashimi"]
  spec.email         = ["Mohib.Hashimi@gmail.com"]

  spec.summary       = %q{This Gem will find your dream beach destination vacation}
  spec.description   = %q{Gem finds the top 25 best beaches in the world along with nearby hotels, restaurants and attractions}
  spec.homepage      = "https://github.com/mohibhashimi786/best25beaches-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri" ">= 0"
  spec.add_dependency "colorize" ">= 0"
end

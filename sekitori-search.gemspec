# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sekitori/search/version"

Gem::Specification.new do |spec|
  spec.name          = "sekitori-search"
  spec.version       = Sekitori::Search::VERSION
  spec.authors       = ["passol78"]
  spec.email         = ["passol.78.valie.77@gmail.com"]

  spec.summary       = %q{SUMO Sekitori Search Client.}
  spec.description   = %q{SUMO Sekitori Search Client.}
  spec.homepage      = "https://github.com/passol78/sekitori-search"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.2"
  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_dependency "activesupport", "~> 5.1"
  spec.add_dependency "launchy", "~> 2.4"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11"
end

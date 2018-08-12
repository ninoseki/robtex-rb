
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "robtex/version"

Gem::Specification.new do |spec|
  spec.name          = "robtex"
  spec.version       = Robtex::VERSION
  spec.authors       = ["ninoseki"]
  spec.email         = ["manabu.niseki@gmail.com"]

  spec.summary       = "Ruby client for the Robtex API"
  spec.description   = "Ruby client for the Robtex API"
  spec.homepage      = "https://github.com/ninoseki/robtex-rb"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.4"

  spec.add_runtime_dependency "thor", "~> 0.19"
end

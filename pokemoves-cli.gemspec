
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pokemoves/cli/version"

Gem::Specification.new do |spec|
  spec.name          = "pokemoves-cli"
  spec.version       = Pokemoves::Cli::VERSION
  spec.authors       = ["'Andrew Ribas'"]
  spec.email         = ["'andrew.j.ribas@gmail.com'"]

  spec.summary       = %q{"Accesses pokemon moves"}
  spec.description   = %q{"Pokemoves allows you to easily check which moves pokemon can learn, as well as which pokemon can learn a specific move. You can also check a move's given type."}
  spec.homepage      = "https://github.com/Directrix777/pokemoves-cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    #spec.metadata["allowed_push_host"] = 'http://RubyGems.org'

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Directrix777/pokemoves-cli"
    spec.metadata["changelog_uri"] = "https://github.com/Directrix777/pokemoves-cli/commits/master"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["pokemoves"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
end

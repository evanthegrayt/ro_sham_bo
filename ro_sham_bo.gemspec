require_relative "lib/ro_sham_bo/version"

Gem::Specification.new do |spec|
  spec.name = "ro_sham_bo"
  spec.version = RoShamBo::VERSION
  spec.authors = ["Evan Gray"]
  spec.email = "evanthegrayt@vivaldi.net"
  spec.license = "MIT"

  spec.summary = %(Rock Paper Scissors in Ruby)
  spec.description = %(Play rock paper scissors from the command line)
  spec.homepage = "https://evanthegrayt.github.io/ro_sham_bo/"

  unless spec.respond_to?(:metadata)
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =
    "https://github.com/evanthegrayt/ro_sham_bo"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rake", "~> 13.0", ">= 13.0.1"
  spec.add_development_dependency "test-unit", "~> 3.3", ">= 3.3.5"
  spec.add_development_dependency "simplecov"
end

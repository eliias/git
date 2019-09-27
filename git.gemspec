# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "git/version"

Gem::Specification.new do |spec|
  spec.name = "git"
  spec.version = Git::VERSION
  spec.authors = ["Hannes Moser"]
  spec.email = ["box@hannesmoser.at"]

  spec.summary = "Git in Ruby"
  spec.description = %q(An incomplete implementation of git in Ruby. Based on James Coglan's book "Building Git")
  spec.homepage = "https://www.hannesmoser.at"
  spec.license = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://www.github.com/eliias/git"
    spec.metadata["changelog_uri"] = "https://github.com/eliias/git/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", "~> 0.1.0"
end

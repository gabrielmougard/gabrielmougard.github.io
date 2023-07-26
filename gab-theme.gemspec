# frozen_string_literal: true

Gem::Specification.new do |spec|
    spec.name          = "gab-theme"
    spec.version       = "1.0.0"
    spec.authors       = ["Gabriel Mougard"]
    spec.email         = ["gabriel.mougard@canonical.com"]

    spec.summary       = "Gabriel Mougard blog theme"
    spec.homepage      = "https://github.com/gabrielmougard/gabrielmougard.github.io"

    spec.files         = `git ls-files -z`.split("\x0").select { |f|
        f.match(%r!^((_(includes|layouts|sass|data)|assets)\/|README|LICENSE)!i)
    }

    spec.metadata = {
        "homepage_uri"      => "https://gabrielmougard.github.io",
        "source_code_uri"   => "https://github.com/gabrielmougard/gabrielmougard.github.io",
        "plugin_type"       => "theme"
    }

    spec.required_ruby_version = ">= 2.6"

    spec.add_runtime_dependency "jekyll", "~> 4.3"
    spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
    spec.add_runtime_dependency "jekyll-redirect-from", "~> 0.16"
    spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7"
    spec.add_runtime_dependency "jekyll-archives", "~> 2.2"
    spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
    spec.add_runtime_dependency "jekyll-include-cache", "~> 0.2"

end
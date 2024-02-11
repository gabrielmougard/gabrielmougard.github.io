# Define default make action
.PHONY: all
all: serve

# Install Jekyll and any dependencies
.PHONY: install
install:
	bundle install

# Build the Jekyll site
.PHONY: build
build:
	bundle exec jekyll build

# Serve the site locally
.PHONY: serve
serve:
	bundle exec jekyll serve

# Clean the site (remove generated site)
.PHONY: clean
clean:
	bundle exec jekyll clean
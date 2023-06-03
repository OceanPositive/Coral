default: project

clean:
	@tuist clean

edit:
	@tuist edit --permanent
	@open Manifests.xcodeproj

fetch:
	@tuist fetch
	@tuist generate --no-open

project: fetch
	@tuist generate

project-no-open: fetch
	@tuist generate --no-open

ci: project-no-open
	@bundle exec fastlane ci

module:
ifdef name
	@tuist scaffold module --name $(name) --example true
else
	@echo "Please make sure to specify a module's name like below"
	@echo "👉 make module name=Foo"
endif

.PHONY: edit fetch project module clean ci

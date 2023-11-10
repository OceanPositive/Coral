default: project

install:
	@./Scripts/install.sh $(env)

uninstall:
	@./Scripts/uninstall.sh

install-templates:
	@./Scripts/install-templates.sh

lint:
# recursive
	@swift-format lint -r Sources
# in place, recursive, parallel
	@swift-format format -irp Sources

mocks:
	@./Scripts/mocking.sh
	@make lint

ci: env:=ci # To avoid installing swift-format

ci: install
	@bundle exec fastlane ci

.PHONY: install uninstall install-templates lint mocks ci

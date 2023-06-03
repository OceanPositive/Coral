default: project

edit:
	@tuist edit --permanent
	@open Manifests.xcodeproj

project:
	@tuist fetch
	@tuist generate

clean:
	@tuist clean

.PHONY: edit project

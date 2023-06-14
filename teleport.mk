teleport-release: image.multiarch.setup
	./hack/teleport-build-and-push.sh

.PHONY: teleport-build
teleport-build: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-build: teleport-release

teleport-push: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-push: export PUSH := true
teleport-push: teleport-release
	
teleport-build-arm: export BUILDX_PLATFORMS := linux/arm64
teleport-build-arm: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-build-arm: teleport-release

.PHONY: teleport-verify
teleport-verify:
	EXCLUDE="verify-all.sh verify-examples-kind.sh" ./hack/verify-all.sh -v

.PHONY: teleport-test
teleport-test: test

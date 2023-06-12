.PHONY: teleport-build
teleport-build: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-build: release-staging

teleport-push: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-push: export PUSH := true
teleport-push: release-staging
	
teleport-build-arm: export BUILDX_PLATFORMS := linux/arm64
teleport-build-arm: export REGISTRY := 146628656107.dkr.ecr.us-west-2.amazonaws.com/gravitational
teleport-build-arm: release-staging

.PHONY: teleport-verify
teleport-verify:
	EXCLUDE="verify-all.sh verify-examples-kind.sh" ./hack/verify-all.sh -v

.PHONY: teleport-test
teleport-test: test

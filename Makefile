lint:
	flutter analyze
.PHONY: lint

proto:
	protoc --dart_out=grpc:lib/grpc/generated -Iprotos protos/csu.proto
.PHONY: proto

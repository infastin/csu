lint:
	flutter analyze
.PHONY: lint

proto:
	protoc --dart_out=grpc:lib/grpc \
		-Iprotos \
		-I/usr/include/google/protobuf \
		csu.proto \
		google/protobuf/timestamp.proto \
		google/protobuf/empty.proto
.PHONY: proto

gen-loc:
	flutter gen-l10n
.PHONY: gen-loc

gen-runner:
	dart run build_runner clean
	dart run build_runner build
.PHONY: gen-json

gen: gen-loc gen-runner
.PHONY: gen

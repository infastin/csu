lint:
	flutter analyze
.PHONY: lint

proto:
	protoc --dart_out=grpc:lib/grpc \
		-Iprotos \
		-I/usr/include/google/protobuf \
		csu.proto \
		google/protobuf/timestamp.proto
.PHONY: proto

gen-loc:
	flutter gen-l10n
.PHONY: gen-loc

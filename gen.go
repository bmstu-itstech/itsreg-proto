package proto

//go:generate protoc --go_out=gen/go/bots --go_opt=paths=source_relative --go-grpc_out=gen/go/bots --go-grpc_opt=paths=source_relative proto/bots.proto

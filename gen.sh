#!/bin/sh

OUT_D="gen"
[ -d "$OUT_D" ] || mkdir "$OUT_D"

GO_OUT_D="$OUT_D"/go
[ -d "$GO_OUT_D" ] || mkdir "$GO_OUT_D"


fetch_service_name() {
    name="${1#*proto\/}"
    name="${name%\.proto}"
    echo "$name"
}

for file in proto/*; do
    name="$(fetch_service_name "$file")"
    echo Compiling "$name"
    [ -d "$GO_OUT_D/$name" ] || mkdir "$GO_OUT_D/$name"
    protoc -I proto "proto/${name}.proto" \
		--go_out="$GO_OUT_D/${name}" \
		--go_opt=paths=source_relative \
		--go-grpc_out="$GO_OUT_D/${name}" \
		--go-grpc_opt=paths=source_relative
done

FROM golang:alpine as builder
RUN apk add --no-cache git
RUN go get github.com/path-network/go-mmproxy
FROM scratch
COPY --from=builder /go/bin/go-mmproxy /app/
COPY allowed-networks.txt /app/
WORKDIR /app
CMD ["./go-mmproxy"]



#============================================#
#          Dockerfile for backend            #
#============================================#


# Stage 1: Build
FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o hunarguru .

# Stage 2: Run
FROM alpine:3.23

RUN apk --no-cache add ca-certificates \
    && addgroup -g 10001 -S hunarguru \
    && adduser -u 10001 -S hunarguru -G hunarguru	

WORKDIR /app

COPY --from=builder --chown=hunarguru:hunarguru /app/hunarguru .
USER 10001:10001

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-periods=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

CMD ["./hunarguru"]

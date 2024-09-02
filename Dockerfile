FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /app/main .

ENTRYPOINT ["./main"]

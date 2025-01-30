# Etapa de build
FROM golang:1.21 AS builder

WORKDIR /app

COPY main.go .

RUN go build -o fullcycle main.go

# Imagem final
FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
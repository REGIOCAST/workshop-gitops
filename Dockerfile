FROM golang:1.15 as build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -o workshop-gitops main.go

FROM alpine:3.12
EXPOSE 8080
WORKDIR /app
COPY --from=build /build/workshop-gitops .
CMD ["./workshop-gitops"]

FROM golang:1.20 AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /execute 

FROM alpine

WORKDIR /

COPY --from=build /execute /execute

ENTRYPOINT ["/execute"]
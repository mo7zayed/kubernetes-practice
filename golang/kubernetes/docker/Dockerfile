FROM golang:latest as builder

ENV APP_HOME /go/src/app

WORKDIR "$APP_HOME"

COPY . .

RUN go mod download
RUN go mod verify
RUN go build -o app .

FROM golang:latest

ENV APP_HOME /go/src/app
RUN mkdir -p "$APP_HOME"
WORKDIR "$APP_HOME"

COPY --from=builder "$APP_HOME"/app $APP_HOME

EXPOSE 80

CMD ["./app"]

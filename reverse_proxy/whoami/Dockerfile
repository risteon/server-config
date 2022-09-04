FROM golang AS build

ARG arch=arm64

COPY . /code
WORKDIR /code

# ENV GOARM 6
ENV GOARCH arm64

RUN go get -d ./...
RUN CGO_ENABLED=0 GOOS=linux GOARCH=$arch go build -a -installsuffix cgo http.go

FROM scratch

COPY --from=build /code/http /http

EXPOSE 8000

CMD ["/http"]


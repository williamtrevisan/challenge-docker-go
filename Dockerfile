FROM golang:1.16 AS builder

WORKDIR /go/src

COPY . .

RUN go build main.go

CMD [ "main" ]

FROM scratch

COPY --from=builder /go/src/main code-education-rocks

CMD [ "./code-education-rocks" ]
# Woothee demo app go

### To update woothee

edit `go.mod` (and version number in `main.go`) and build `go build`

### DevServer

1. `go build`
1. `./main`
1. open http://localhost:8080

### Upload

1. `gcloud app deploy --project woothee-demo`
1. check https://go-demo-dot-woothee-demo.appspot.com/api

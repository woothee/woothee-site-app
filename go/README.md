# Woothee demo app go

do at first
 * `export GOROOT=/usr/local/go/bin/go`
 * `export PATH=/usr/local/go/bin:~/tmp/go_appengine:$PATH`
 * `export GOPATH=~/tmp/gomodules`

### DevServer

1. `go get github.com/woothee/woothee-go`
1. `goapp serve`
1. open http://localhost:8080

### Upload

1. `goapp deploy -oauth go`
1. check http://go.woothee-demo.appspot.com/parse

package main

import (
	"encoding/json"
	"fmt"
	"github.com/woothee/woothee-go"
	"log"
	"net/http"
	"net/url"
	"os"
)

const (
	WootheeVersion = "1.8.0"
)

type ApiResponse struct {
	Version string          `json:"version"`
	Result  *woothee.Result `json:"result"`
}

func main() {
	http.HandleFunc("/parse", parse)
	http.HandleFunc("/api", api)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
		log.Printf("Defaulting to port %s", port)
	}

	log.Printf("Listening on port %s", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}

func parse(w http.ResponseWriter, r *http.Request) {
	agent := r.UserAgent()
	m, _ := url.ParseQuery(r.URL.RawQuery)
	v, ok := m["ua"]
	if ok {
		agent = v[0]
	}

	result, err := woothee.Parse(agent)
	if err == woothee.ErrNoMatch {
		result = woothee.EmptyResult
	}
	json, _ := json.Marshal(result)

	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-type", "application/json")
	fmt.Fprint(w, string(json))
}

func api(w http.ResponseWriter, r *http.Request) {
	agent := r.UserAgent()
	m, _ := url.ParseQuery(r.URL.RawQuery)
	v, ok := m["ua"]
	if ok {
		agent = v[0]
	}

	result, err := woothee.Parse(agent)
	if err == woothee.ErrNoMatch {
		result = woothee.EmptyResult
	}
	res := &ApiResponse{
		Version: WootheeVersion,
		Result:  result,
	}
	json, _ := json.Marshal(res)

	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-type", "application/json")
	fmt.Fprint(w, string(json))
}

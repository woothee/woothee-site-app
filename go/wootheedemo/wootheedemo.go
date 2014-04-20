package wootheedemo

import (
	"fmt"
	"net/http"
	"net/url"
	"encoding/json"
	"github.com/woothee/woothee-go"
)

func init() {
	http.HandleFunc("/parse", parse)
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

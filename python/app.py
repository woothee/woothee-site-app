"""woothee demo api app."""

import webapp2
import json

import os
import sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'woothee', 'lib'))

import woothee

class WootheeDemoAppParse(webapp2.RequestHandler):
    def get(self):
        ua = self.request.headers['User-Agent']
        if 'ua' in self.request.GET:
            ua = self.request.GET['ua']
        self.response.headers['Access-Control-Allow-Origin'] = '*'
        self.response.content_type = 'application/json'
        self.response.write(json.dumps(woothee.parse(ua)))

class WootheeDemoAppApi(webapp2.RequestHandler):
    def get(self):
        ua = self.request.headers['User-Agent']
        if 'ua' in self.request.GET:
            ua = self.request.GET['ua']
        self.response.headers['Access-Control-Allow-Origin'] = '*'
        self.response.content_type = 'application/json'
        data = {
            "version": "unknown",
            "result": woothee.parse(ua),
        }
        self.response.write(json.dumps(data))

application = webapp2.WSGIApplication([
    ('/parse', WootheeDemoAppParse),
    # ('/api', WootheeDemoAppApi),
], debug=True)

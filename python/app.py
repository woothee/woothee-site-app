"""woothee demo api app."""

import webapp2
import json

import os
import sys

from google.appengine.ext import vendor
# Add any libraries installed in the "lib" folder.
# by `pip install -t lib woothee`
vendor.add('lib')

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
            "version": woothee.__version__,
            "result": woothee.parse(ua),
        }
        self.response.write(json.dumps(data))

application = webapp2.WSGIApplication([
    ('/parse', WootheeDemoAppParse),
    ('/api', WootheeDemoAppApi),
], debug=True)

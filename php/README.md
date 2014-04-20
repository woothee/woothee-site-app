# Woothee demo app php

### DevServer

1. `~/tmp/php/bin/composer update`
1. `~/tmp/google_appengine/dev_appserver.py --php_executable_path ~/tmp/php/bin/php php`
1. open http://localhost:8080

(It does not work correctly?)

### Upload

1. `~/tmp/google_appengine/appcfg.py --oauth2 update php/`
1. check http://php.woothee-demo.appspot.com/api

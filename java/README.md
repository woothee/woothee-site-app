# Woothee demo app Java

### DevServer

1. copy `woothee.jar` into `wootheedemo-war/lib/`
1. `mvn clean install`
1. `cd wootheedemo-ear`
1. `mvn appengine:devserver`
1. open http://localhost:8080

### Upload

1. `cd wootheedemo-ear`
1. `mvn appengine:update`
1. check http://java.woothee-demo.appspot.com/parse

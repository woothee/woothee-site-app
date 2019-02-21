var express = require('express')
  , woothee = require('woothee')
  , app = express();

var bodyParser = require('body-parser')
  , methodOverride = require('method-override')
  , logger = require('morgan');

function shutdown(signal){
  console.log((new Date()).toString() + ': Shutdown by signal, ' + signal);
  process.exit();
};
process.on('SIGINT', function(){ shutdown('SIGINT'); });
process.on('SIGHUP', function(){ shutdown('SIGHUP'); });
process.on('SIGQUIT', function(){ shutdown('SIGQUIT'); });
process.on('SIGTERM', function(){ shutdown('SIGTERM'); });

app.set('port', process.env.PORT || 3000);

app.use(logger('combined'));
app.use(methodOverride());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function(err, req, res, next){
  if (!err) { next(); } 
  else {
    console.log(err);
    if (err instanceof Object)
      err = JSON.stringify(err);
    res.send(500, err);
  }
});   

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.get('/', function(req, res){
  res.redirect('/index.html');
});

app.get('/parse', function(req, res){
    res.json(woothee.parse(req.query.ua || req.get('User-Agent')));
});

app.get('/api', function(req, res){
  var data = {
    version: woothee.VERSION,
    result: woothee.parse(req.query.ua || req.get('User-Agent'))
  };
  res.json(data);
});

app.listen(app.get('port'));

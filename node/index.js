var express = require('express')
  , woothee = require('woothee')
  , app = express();

function shutdown(signal){
  console.log((new Date()).toString() + ': Shutdown by signal, ' + signal);
  process.exit();
};
process.on('SIGINT', function(){ shutdown('SIGINT'); });
process.on('SIGHUP', function(){ shutdown('SIGHUP'); });
process.on('SIGQUIT', function(){ shutdown('SIGQUIT'); });
process.on('SIGTERM', function(){ shutdown('SIGTERM'); });

app.configure(function(){
  app.use(express.logger('default'));
  app.use(express.methodOverride());
  app.use(express.urlencoded());
  app.use(express.json());
  app.use(express.bodyParser());
  
  app.use(express.static('../site'));
  app.use(express.directory('../site'));
  app.use(app.router);
  
  app.set('port', (process.env.PORT || 3000));
});

app.use(function(err, req, res, next){
  if (!err) { next(); } 
  else {
    console.log(err);
    if (err instanceof Object)
      err = JSON.stringify(err);
    res.send(500, err);
  }
});   

app.get('/', function(req, res){
  res.redirect('/index.html');
});

app.get('/parse', function(req, res){
  res.send(woothee.parse(req.query.ua || req.get('User-Agent')));
});

app.listen(app.get('port'));

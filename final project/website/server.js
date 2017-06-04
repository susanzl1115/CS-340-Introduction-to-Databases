
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var handlebars = require('express-handlebars').create({defaultLayout:'main'});
var port = process.env.PORT ||2280;

var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_zhangl8',
  password        : '23530265Zl',
  database        : 'cs340_zhangl8'
});

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', 2280);
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(express.static('public'));

app.get('/', function(req, res) {
	res.render('home');
});

var selectTableData = function(res, table) {
  var ctx = {};
  pool.query('SELECT * FROM ' + table, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = rows;
    res.send(ctx);
  });
};

app.get('/pokemon', function(req,res){
	selectTableData(res,'pokemon');
});

app.get('/pokemon_type',function(req,res){
	selectTableData(res,'pokemon_type');
});

app.get('/catch', function(req,res){
	selectTableData(res,'catch');
});

app.get('/player',function(req,res){
	selectTableData(res,'player');
});

app.get('/location',function(req,res){
	selectTableData(res,'location');
});

app.post('/search_catch', function(req, res) {
  var ctx = {};
  var body = req.body;
  var queryStr = "SELECT catch_time FROM catch ";
  queryStr += 'INNER JOIN player ON player.player_id = catch.player_id ';
  queryStr += 'INNER JOIN location ON location.location_id = catch.location_id';
  queryStr += 'INNER JOIN pokemon ON pokemon.pokemon_id = catch.pokemon_id';
  queryStr += ' WHERE pokemon.pokemon_name = "' + body.pokemon_name + '";';

  pool.query(queryStr, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = rows;
    res.send(ctx);
  });
});

var generateUpdateStr = function(body, table) {
  var keys = [];
  var values = [];
  var str = '';
  for (var key in body) {
    keys.push(key);
    values.push("'" + body[key] + "'");
  }
  str += "INSERT INTO " + table;
  str += "(" + keys.join(",") + ")";
  str += " VALUES (" + values.join(",") + ");";

  return str;
};

var updateEntry = function(req, res, table) {
  var updateStr = generateUpdateStr(req.body, table);

  pool.query(updateStr, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    res.send(JSON.stringify(rows));
  });
};

app.post('/pokemon', function(req, res) {
  updateEntry(req, res, 'pokemon');
});

app.post('/pokemon_type', function(req, res) {
  updateEntry(req, res, 'pokemon_type');
});

app.post('/catch', function(req, res) {
  updateEntry(req, res, 'catch');
});

app.post('/player', function(req, res) {
  updateEntry(req, res, 'player');
});

app.post('/location', function(req, res) {
  updateEntry(req, res, 'location');
});

var deleteEntry = function(req, res, table) {
  var ctx = {};
  var pokemon_id = req.body.pokemon_id;
  pool.query('DELETE FROM ' + table + ' WHERE pokemon_id = ' + pokemon_id, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = JSON.stringify(rows);
    res.send(ctx);
  });
};

var deleteEntry = function(req, res, table) {
  var ctx = {};
  var player_id = req.body.player_id;
  pool.query('DELETE FROM ' + table + ' WHERE player_id = ' + player_id, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = JSON.stringify(rows);
    res.send(ctx);
  });
};

var deleteEntry = function(req, res, table) {
  var ctx = {};
  var location_id = req.body.location_id;
  pool.query('DELETE FROM ' + table + ' WHERE location_id = ' + location_id, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = JSON.stringify(rows);
    res.send(ctx);
  });
};

app.delete('/pokemon', function(req, res) {
  deleteEntry(req, res, 'pokemon');
});

app.delete('/player', function(req, res) {
  deleteEntry(req, res, 'player');
});

app.delete('/location', function(req, res) {
  deleteEntry(req, res, 'location');
});



app.delete('/catch', function(req, res) {
  var ctx = {};
  var body = req.body;
  var player_id = body.player_id;
  var pokemon_id = body.pokemon_id;
  var location_id=body.location_id;

  var queryStr = 'DELETE FROM catch WHERE pokemon_id = ' + pokemon_id;
  queryStr += ' AND player_id = ' + player_id;
  queryStr += ' AND location_id=' + location_id +';';

  pool.query(queryStr, function(err, rows, fields) {
    if (err) {
      console.log(err);
      return;
    }
    ctx.results = JSON.stringify(rows);
    res.send(ctx);
  });
});

app.use(function(req, res) {
	res.status(404);
	res.render('404');
});

app.use(function(err, req, res, next){
	console.log(err.stack);
	res.status(500);
	res.render('500');
});

app.listen(app.get('port'), function() {
	console.log('Application started on port ' + app.get('port'));
});




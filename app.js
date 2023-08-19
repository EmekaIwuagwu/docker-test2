var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var mysql = require("mysql");
var port = process.env.PORT || 3000;

app.use(function (req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type"
  );
  res.setHeader("Access-Control-Allow-Credentials", true);
  next();
});

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get("/api/", function (req, res) {
  return res.send({ error: false, message: "hello" });
});

var dbConn = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "pass1234",
  database: "employeedb",
});

app.post("/api/save-post", function (req, res) {
  var postData = req.body;
  dbConn.query(
    "INSERT INTO employeeDBtable SET ?",
    postData,
    function (error, results, fields) {
      if (error) throw error;
      return res.send({ error: false, data: results, message: "OK" });
    }
  );
});

app.get("/api/posts", function (req, res) {
  dbConn.query(
    "select * from employeeDBtable",
    postData,
    function (error, results, fields) {
      if (error) throw error;
      return res.send({ error: false, data: results, message: "OK" });
    }
  );
});

module.exports = dbConn;

app.listen(port, function () {
  console.log("App running on Port: " + port);
});

module.exports = app;

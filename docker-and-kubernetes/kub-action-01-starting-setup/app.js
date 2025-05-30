const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send(`
    <h1>Hello from this NodeJS app!!!</h1>
    <p>This is new!</p>
    <p>version 2.0.0</p>
    <p>Try sending a request to /error and see what happens</p>
  `);
});

app.get("/error", (req, res) => {
  process.exit(1);
});

app.listen(8080);

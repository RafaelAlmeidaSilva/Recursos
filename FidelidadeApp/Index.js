var express = require('express');
const consign = require('consign');

var app = express();
consign()
  .include('libs/middlewares.js')
  .then('routes')
  .then('libs/boot.js')
  .into(app);

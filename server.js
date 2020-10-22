let url = require('url');
let express = require('express');
let cors = require('cors');
let bodyParser = require('body-parser');
let app = express();
let db = require('.lib/db');


app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(cors());


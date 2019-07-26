//import bodyParser from 'body-parser';
var bodyParser = require('body-parser');
var handleBars = require('express-handlebars');
const helmet = require('helmet');

module.exports = app => {
    //Helmet
    //config
    app.use(helmet());

    // Body Parser
    // config
    app.use(bodyParser.urlencoded({extended:false}))
    app.use(bodyParser.json())
    
    // Template Engine
    // config
    app.engine('handlebars', handleBars({defaultLayout: 'main'}))
    app.set('view engine','handlebars')
}
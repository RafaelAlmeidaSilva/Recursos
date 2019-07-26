
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const sequelize = new Sequelize(
    "consultaextrato",
    "root", 
    "Admin",
    {
      host: "localhost",
      dialect: 'mysql',
      logging: false,
      freezeTableName: true,
      operatorsAliases: {
        $and: Op.and,
        $or: Op.or,
        $eq: Op.eq,
        $gt: Op.gt,
        $lt: Op.lt,
        $lte: Op.lte,
        $like: Op.like
      }
    }
  )

var extrato = sequelize.define('extratos', {
  
    numeroCartao:{
        type: Sequelize.STRING
    },
    pontos:{
        type: Sequelize.INTEGER
    },
    saldo:{
        type: Sequelize.FLOAT
    }

});

module.exports = app => {
    app.post('/ConsultaExtrato', function(req, res){
        var request = require('request');

        var headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        };
        
                var dataString = `{chaveIntegracao:"`+req.body.txtChaveIntegracao+
            `", codigoLoja:"`+req.body.txtCodigoLoja+
            `", numeroCartao:"`+req.body.txtNumeroCartao+
            `",nsuCliente:"string" , codigoSeguranca: "string" }`;
        
        
        var options = {
            url: 'https://hfllinxintegracaogiftwebapi-hom.azurewebsites.net/LinxServiceApi/FidelidadeService/ConsultaFidelizacao',
            method: 'POST',
            headers: headers,
            body: dataString
        };
        
        var json ;
        
        function callback(error, response, body) {
            console.log(response.statusCode);
            if (!error && response.statusCode == 200) {
                json= JSON.parse(body);
                console.log('Ponto: ',json.saldoEmPontos);
                console.log('Saldo: R$ ',json.saldoEmReais);
                extrato.create({
                                    numeroCartao:req.body.txtNumeroCartao,
                                    pontos: json.saldoEmPontos,
                                    saldo: parseFloat(json.saldoEmReais.replace(/,/g, ''))
                                }).then( function(id){
                                    console.log(id.dataValues.id);
                                    json.nsuCliente = id.dataValues.id;
                                    var v = 4;
                                    v = ("0000" + v).slice(-4);
                                    res.render('formConsultaExtrato', {saldo: json.saldoEmReais, pontos: json.saldoEmPontos, nsu: ("0000000" +json.nsuCliente).slice(-7+(json.nsuCliente.length))})
                                })
                
            }
        }
        
        request(options, callback);
        

    });

    app.get('/', function(req, res){
        res.render('formConsultaExtrato');
    });
}

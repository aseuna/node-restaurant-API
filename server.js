let url = require('url');
let express = require('express');
let cors = require('cors');
let bodyParser = require('body-parser');
let app = express();
let db = require('./lib/db');


app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(cors());

app.get('/fooditems', async function(req, res){
    let sql_fooditems = "SELECT fooditem.id, fooditem.name, fooditem.price, fooditem.category, fooditem.description, fooditem.imgPath FROM fooditem;";
    let sql_categories = "SELECT category.id, category.name FROM category;";
    try{
        await db.connect();
        let foodItems;
        let categories;
        await db.con.query(sql_fooditems, function(err, result, fields){
            if (err) throw err;
            console.log(result);
            foodItems = result;
        });

        await db.con.query(sql_categories, function(err, result, fields){
            if (err) throw err;
            categories = result;
        });
        console.log(foodItems);

        res.status(200).json({data: "SUCCESS"});
    }catch(error){
        console.log(error);
    }finally{
        db.close();
    }
});

app.listen(process.env.PORT, function(){
    console.log('App listening port:' + process.env.PORT);
});
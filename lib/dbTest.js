let mysql = require('mysql');
require('dotenv').config();

module.exports = {
    config: {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_TEST_NAME
    },
    con: null,
    connect: async function(){
        this.con = mysql.createConnection(this.config);
        this.con.connect(function(err) {
            if (err) throw err;
        });
    },
    close: async function(){
        try{
            this.con.end();
            this.con = null;
        }
        catch(err){
            console.log(err);
        }
    }
}
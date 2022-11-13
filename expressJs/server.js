const express = require("express");
const app = express();
const { Pool } = require('pg');

const host = process.env.DB_HOST || 'postgres';
const port = process.env.DB_PORT || '5432';
var express_port = 3000

const pool = new Pool({
    user: 'dbuser',
    host: host,
    // host: 'localhost',
    database: 'sample-db',
    password: 'secretpassword',
    port: parseInt(port),
})

app.listen(express_port, '0.0.0.0', ()=>{
    console.log('Application listening at 0.0.0.0:'+express_port);
})

app.get('/cars', async (req,res)=>{
    const result = await pool.query('SELECT * FROM cars');
    res.send(result.rows);
})

app.post('/cars/add', async (req,res)=>{
    const result = await pool.query("INSERT INTO cars (car_id, model, year, details) VALUES (4, 'Mitsubishi Pajero', 2014, 'Great off-road vehicle')");
    res.send(result.rows);
})

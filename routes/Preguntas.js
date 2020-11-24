const express = require('express');
const router = express.Router();
const mysqlConnection  = require('../db/db');
//get listo
router.get('/Preguntas', (req, res) => {
     
  mysqlConnection.query('SELECT * FROM Preguntas', (err, rows, fields) => {
      if (!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });
  });
  router.get('/Respuestas', (req, res) => {
     
    mysqlConnection.query('SELECT * FROM Respuestas', (err, rows, fields) => {
        if (!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
    });
    


module.exports = router;
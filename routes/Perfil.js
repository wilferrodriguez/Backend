const express = require('express');
const router = express.Router();
const mysqlConnection  = require('../db/db');
//get listo
router.get('/Usuario', (req, res) => {
     
  mysqlConnection.query('SELECT * FROM `Usuario`', (err, rows, fields) => {
      if (!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });
  });
  
//post listo
router.post('/newUsuario',(req,res)=>{
const {NOMBRE,CORREO,CONTRASEÑA,TIPO} = req.body;
let User = [NOMBRE,CORREO,CONTRASEÑA,TIPO ];

let NewUser = `INSERT INTO USUARIO (NOMBRE, CORREO, CONTRASEÑA, TEORIA, PREGUNTAS) VALUES (?,?,?,?,?)`;
mysqlConnection.query(NewUser, User, (err, results, fields) => {
  if (err) {
    return console.error(err.message);
  }
  res.json({ message:`Usuario registrado` })
  });
});  
//put listo

router.put('/Usuario/:ID', (req, res) => {
  const {USUARIO,CORREO,CONTRASEÑA} = req.body;
  const {ID} = req.params;
  mysqlConnection.query(`UPDATE Usuario SET NOMBRE = ?, CORREO = ?, CONTRASEÑA = ?, TIPO = ? WHERE ID = ?`, 
  [USUARIO,CORREO,CONTRASEÑA,ID], (err, rows, fields) => {
    if(!err) {
      res.json({message: 'Usuario actualizado'});
    } else {
      console.log(err);
    }
  });
});



router.delete('/Usuario/:ID', (req, res) => {
  const { ID } = req.params;
  mysqlConnection.query(`DELETE FROM Usuario WHERE Usuario.ID=${ID}`, (err, rows, fields) => {
    if(!err) {
      res.json('el usuario ha sido eliminado');
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
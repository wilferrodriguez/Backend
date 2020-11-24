const mysql = require("mysql");
const mysqlConnection = mysql.createConnection({
  host: "bhjse15y6ibppmero57f-mysql.services.clever-cloud.com",
  user: "u7brftity4rwiici",
  password: "21i90TfiXhaI8kbdOB5A",
  database: "bhjse15y6ibppmero57f",
  multipleStatements: true

  // host:'bz6uvndcnhfr7mavr9f2-mysql.services.clever-cloud.com',
  // user:'ueeuwupkuykeozg6',
  // password:'xOSqBorgS9GXqXcO0gdp',
  // database:'bz6uvndcnhfr7mavr9f2',
  // multipleStatements: true
});
mysqlConnection.connect(function (err) {
  if (err) {
    console.error(err);
    return;
  } else {
    console.log("base de datos conectada!");
  }
});

module.exports = mysqlConnection;

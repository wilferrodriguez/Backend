const express = require("express");
const app = express();
const cors = require("cors");
const Perfil = require("./routes/Perfil.js");
const Preguntas = require("./routes/Preguntas.js");

// Ajustes
app.set("port", process.env.PORT || 3000);

// Middlewares
app.use(
  cors({
    exposedHeaders: [
      "Origin",
      "X-Requested-With",
      "Content-Type",
      "Accept",
      "Accept-Language",
      "Authorization"
    ]
  })
);
//app.use(cors({origin: 'https://kuepj-3000.sse.codesandbox.io'}));
app.use(express.json());

// Routes//
app.use("/api", Perfil);
//prueba  app.use('/api',Preguntas);

// Ajustes del servidor
app.listen(app.get("port"), () => {
  console.log(`Servidor corriendo en el puerto ${app.get("port")}`);
});

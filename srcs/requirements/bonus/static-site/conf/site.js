const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, {'content-type': 'text/html'});
  res.write("<!DOCTYPE html>");
  res.write("<html>");
  res.write("<head><style>h1 {color: darkmagenta;}</style><title>Naruto Site Adaloui</title><link rel=\"icon\" type=\"image/x-icon\" href=\"KonohaSymbol.png\"></head>");
  res.write("<body style=\"background-color: coral;\">");
  res.write("Salut les amis");
  res.write("<h1>Mon grand titre</h1><p>Mon paragraphe</p><br /><p>Je suis dans un autre paragraphe</p><hr>");
  res.write("<h2>Naruto</h2>");
  res.write("<img src=\"https://www.cjoint.com/doc/20_04/JDevgsUlF1B_naruto-shippuden-wallpapers-joyeux.jpg\" alt=\"Naruto dans son adolescence\" width=\"500\" height=\"500\"> <br />");
  res.write("<p>Un lien vers sa <a href=\"https://naruto.fandom.com/fr/wiki/Naruto_Uzumaki\">biographie</a></p>");
  res.write("<p>La technique favorite de Naruto, le Rasengan : <img src=\"https://media.tenor.com/VXJeIRgdC_oAAAAM/naruto-rasengan.gif\" alt=\"Rasengan de Naruto\"></p>");
  res.write("<hr><h2>Sasuke</h2>");
  res.write("<img src=\"https://i.pinimg.com/originals/d4/09/85/d40985f36f28a9ec66994cc4d56fcf9f.jpg\" alt=\"Sasuke dans son enfance\" width=\"500\" height=\"500\">  <br />");
  res.write("<p>Un lien vers sa <a href=\"https://naruto.fandom.com/fr/wiki/Sasuke_Uchiwa\">biographie</a></p>");
  res.write("<p>La technique fétiche de Sasuke AU Taijutsu, le Chichi Rendan : <img src=\"https://i.makeagif.com/media/10-11-2020/Dm-hz-.gif\" alt=\"Chichi Rendan de Sasuke\"></p>");
  res.write("</body>");
  res.write("</html>");
  res.end("Fin du site");
})

server.listen(150, () => {
  console.log("Server is running.");
})
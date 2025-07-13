PImage imagenReferencia;

float espaciadoLinea = 26;  // Espaciado de línea
float grosorLineaFondo = 14; // Grosor de la línea del fondo
float rotacionAngulo = 135; // Rotación del ángulo

float cuadradoBlancoSize; // Tamaño del lado del cuadrado blanco
float cuadradoBlancoX;    // Posición X del centro del cuadrado blanco
float cuadradoBlancoY;    // Posición Y del centro del cuadrado blanco

float grosorLineaInclinada = 12;   // Grosor de la línea inclinada

float xPosCuadrado = 600; // Posición X del centro del cuadrado grande
float yPosCuadrado = 200; // Posición Y del centro del cuadrado grande
float tamañoCuadrado = 288; // Tamaño del cuadrado grande
float espaciadoLineasCuadrado = 24; // Espaciado entre las líneas del cuadrado grande
float grosorLineasCuadrado = 12; // Grosor de las líneas del cuadrado grande

void setup() {
  size(800, 400);
  imagenReferencia = loadImage("28.jpg");
  imagenReferencia.resize(400, 400);
  cuadradoBlancoSize = 150; // Tamaño de 150x150 píxeles
  cuadradoBlancoX = xPosCuadrado; // Centrado horizontalmente con el cuadrado grande
  cuadradoBlancoY = yPosCuadrado; // Centrado verticalmente con el cuadrado grande
}

void draw() {
  if (mousePressed) {
    background(0); 
  } else {
    background(255); 
  }

  color colorLinea;    
  color colorFondo;    

  if (mousePressed) {
    colorLinea = color(255); 
    colorFondo = color(0);   
  } else {
    colorLinea = color(0);   
    colorFondo = color(255); 
  }

  stroke(colorLinea); 
  strokeWeight(grosorLineaFondo); 
  strokeCap(PROJECT); 

  pushMatrix(); 
  translate(width / 2, 0); 
  translate((width / 2) / 2, height / 2); 
  rotate(radians(rotacionAngulo)); 
  translate(-(width / 2) / 2, -height / 2); 

  float anchoDoble = width * 2;  
  float altoDoble = height * 2;    

  float inicioYLinea = -200 + (grosorLineaFondo / 2); 
  float finYLinea = altoDoble - (grosorLineaFondo);   

  float rangoXefectivo = dist(0, 0, anchoDoble, altoDoble); 
  float inicioXBucle = -rangoXefectivo / 2 - grosorLineaFondo; 
  float finXBucle = rangoXefectivo / 2 + grosorLineaFondo;   

  for (float x = inicioXBucle; x <= finXBucle; x += espaciadoLinea) {
    line(x, inicioYLinea, x, finYLinea); 
  }
  popMatrix(); 

  fill(colorFondo);      
  noStroke();     
  rectMode(CENTER); 
  rect(xPosCuadrado, yPosCuadrado, tamañoCuadrado, tamañoCuadrado);     

  stroke(colorLinea);
  strokeWeight(grosorLineasCuadrado); 
  strokeCap(PROJECT);    
  pushMatrix(); 
  translate(xPosCuadrado, yPosCuadrado); 

  float inicioYLineaCuadrado = -tamañoCuadrado / 2 + (grosorLineasCuadrado / 2);
  float finYLineaCuadrado = tamañoCuadrado / 2 - (grosorLineasCuadrado / 2);

  float inicioXLineaCuadrado = -tamañoCuadrado / 2 + (grosorLineasCuadrado / 2);
  float finXLineaCuadrado = tamañoCuadrado / 2 - (grosorLineasCuadrado / 2);

  for (float x = inicioXLineaCuadrado; x <= finXLineaCuadrado; x += espaciadoLineasCuadrado) {
    line(x, inicioYLineaCuadrado, x, finYLineaCuadrado); 
  }

  popMatrix(); 

  float imgX = (width / 2) / 2 - imagenReferencia.width / 2; 
  float imgY = height / 2 - imagenReferencia.height / 2;
  image(imagenReferencia, imgX, imgY); 

  fill(colorFondo);      
  noStroke();     
  rectMode(CENTER); 
  rect(cuadradoBlancoX, cuadradoBlancoY, cuadradoBlancoSize, cuadradoBlancoSize); 

  stroke(colorLinea);                  
  strokeWeight(grosorLineaInclinada);  
  strokeCap(PROJECT);         

  float x1Linea = cuadradoBlancoX - cuadradoBlancoSize / 2; 
  float y1Linea = cuadradoBlancoY + cuadradoBlancoSize / 2; 

  float x2Linea = cuadradoBlancoX + cuadradoBlancoSize / 2; 
  float y2Linea = cuadradoBlancoY - cuadradoBlancoSize / 2; 

  line(x1Linea, y1Linea, x2Linea, y2Linea); 
}

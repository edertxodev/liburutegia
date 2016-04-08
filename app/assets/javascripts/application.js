// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// al acceder a la aplicación
$(document).ready(function(){
    cambiarColorEnlaces(); // Al pasar sobre los elementos del menú cambian de color
    // buscador libros AJAX
    buscadorLibrosAjax();
    // genera una clave cada vez que se recarga la página
    $('.pass-aleatoria').each(function(){
      $(this).val(passGenerator(8));
    });
    // genera una clave al pulsar el botón
    $('.regenerar-pass').click(function(){
      $('.pass-aleatoria').val(passGenerator(8));
    });
});

// al cargar nuevas páginas
$(document).on('page:load', function(){
    cambiarColorEnlaces(); // Al pasar sobre los elementos del menú cambian de color
    // buscador libros AJAX
    buscadorLibrosAjax();
    // genera una clave cada vez que se recarga la página
    $('.pass-aleatoria').each(function(){
      $(this).val(passGenerator(8));
    });
    // genera una clave al pulsar el botón
    $('.regenerar-pass').click(function(){
      $('.pass-aleatoria').val(passGenerator(8));
    });
});


// Funciones

function cambiarColorEnlaces(){ 
    $('.li-menu').hover(function(){
        $(this).css('background-color', 'rgb(0,0,120');
    }, function(){
        $(this).css('background-color', 'rgb(0,0,150');
    });
}

// generador de contraseñas
function passGenerator(length, special) {
  var iteration = 0;
  var password = "";
  var randomNumber;
  if(special == undefined){
      var special = false;
  }
  while(iteration < length){
    randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33;
    if(!special){
      if ((randomNumber >=33) && (randomNumber <=47)) { continue; }
      if ((randomNumber >=58) && (randomNumber <=64)) { continue; }
      if ((randomNumber >=91) && (randomNumber <=96)) { continue; }
      if ((randomNumber >=123) && (randomNumber <=126)) { continue; }
    }
    iteration++;
    password += String.fromCharCode(randomNumber);
  }
  
  return password;
}

// Buscador AJAX
function buscadorLibrosAjax(){
  $("#tabla-libros th a, #tabla-libros .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#form-buscar-libros input").keyup(function() {
    $.get($("#form-buscar-libros").attr("action"), $("#form-buscar-libros").serialize(), null, "script");
    return false;
  });
}
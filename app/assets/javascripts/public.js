window.addEventListener('hashchange', function(e){
  console.log("hashchange")
  document.getElementById("public_nav").style.display = "block"
}, false);

window.onhashchange = function () {
  console.log("hashchange")
}



  window.addEventListener('scroll', function(e) {
    if(window.scrollY<195 && window.scrollY>25){
      document.getElementById("logo_centerer").style.height = (250-window.scrollY+25).toString() +"px"
    }else{
      document.getElementById("logo_centerer").style.height = "50 px"
    }
    if(window.scrollY<275){
      hideNav()
    }else{
      showNav()
    }
  });

window.onload = hideNav

function hideNav(){
  document.getElementById("public_nav").style.display = "none"
}

function showNav(){
  document.getElementById("public_nav").style.display = "block"
}

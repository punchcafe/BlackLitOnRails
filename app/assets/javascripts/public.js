  window.addEventListener('scroll', function(e) {
    if(window.scrollY<210 && window.scrollY>25){
      document.getElementById("logo_centerer").style.height = (250-window.scrollY+25).toString() +"px"
    }else{
      document.getElementById("logo_centerer").style.height = "50 px"
    }
    if(window.scrollY<275){
      document.getElementById("public_nav").style.display = "none"
    }else{
      document.getElementById("public_nav").style.display = "block"
    }
    console.log(window.scrollY);
  });

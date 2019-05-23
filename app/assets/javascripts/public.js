  window.addEventListener('scroll', function(e) {
    if(window.scrollY<210 && window.scrollY>25){
      document.getElementById("logo_centerer").style.height = (250-window.scrollY+25).toString() +"px"
    }else{
      document.getElementById("logo_centerer").style.height = "50 px"
    }
    console.log(window.scrollY);
  });

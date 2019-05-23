  window.addEventListener('scroll', function(e) {
    if(window.scrollY<250){
      document.getElementById("logo_centerer").style.height = (((250-window.scrollY)/250)*200+50).toString() +"px"
    }else{
      document.getElementById("logo_centerer").style.height = "50 px"
    }
    console.log(window.scrollY);
  });

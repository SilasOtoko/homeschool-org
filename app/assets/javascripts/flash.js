function FlashMessageFadeout(){
  $(document).ready(function(){
  setTimeout(function(){
    $('#flash').fadeTo("slow", "0");
  }, 3000);
 })
}

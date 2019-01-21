$(document).on('turbolinks:load',function(){

  $('.homeTopMainWrapperTitle').hover(function(){
    $('.homeTopMainWrapperDirection').fadeIn();
  },function(){
    $('.homeTopMainWrapperDirection').fadeOut();
  });

});

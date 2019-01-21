$(document).on('turbolinks:load',function(){

  // $('.homeTopMainWrapperTitle').hover(function(){
  //   $('.homeTopMainWrapperDirection').fadeIn();
  // },function(){
  //   $('.homeTopMainWrapperDirection').fadeOut();
  // });

  $('.homeTopMainWrapperTitle').hover(function(){
    $('.homeTopMainWrapperDirection').removeClass('hidden');
  },function(){
    $('.homeTopMainWrapperDirection').addClass('hidden');
  });

});

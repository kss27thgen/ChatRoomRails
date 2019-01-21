$(document).on('turbolinks:load',()=>{

  function buildHtml(message){
    const image = message.image ? `<img src="${message.image}">` : "";
    const html = `<div class="chatBody" data-id = "${message.id}">
                  <h4 class="chatBody__name">${message.user_name}<span class="chatBody__belongsTo"> [${message.user_hello}]</span><span class="chatBody__time"> ${message.date}</span><a href="/groups/${message.group_id}/messages/${message.id}" class="chatBody__delete" data-method="delete"> x</a></h4>
                  <div class="chatBody__text">${message.text}</div>
                  <div class="chatBody__image">${image}</div>
                </div>`
    $('.chatBodies').append(html);
  }
  function scrollTop(){
    const pos = $('.chatBodies')[0].scrollHeight - 100;
    $('html,body').animate({ scrollTop: pos }, 2000);
  }

// メッセージ投稿
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    e.stopPropagation();
    const formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'post',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      $('#new_message')[0].reset();
      buildHtml(message);
      scrollTop();
    })
    .fail(function(){
      alert('エラーですよ');
    })
  });

// メッセージ自動更新機能
  let interval = setInterval(function (){
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      let message_id = $('.chatBody').last().data('id');
      $.ajax({
        url: location.href,
        type: 'get',
        data: {latest_id: message_id},
        dataType: 'json',
      })
      .done(function(messages){
        messages.forEach(function(message){
          buildHtml(message);
        })
        scrollTop();
      })
      .fail(function(){
        alert('自動更新に失敗しましたよ');
      })
    }else{
      clearInterval(interval);
    }
  }, 20000)


// メッセージ削除
  $('html').on('click', '.chatBody__delete', function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).parent().parent().hide();
    let url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'delete',
      dataType: 'json',
    })
  });

// 画面上へのスクロール
  $('.chatHeader__topBtn').on('click', ()=>{
    $('html,body').animate({ scrollTop: 2 }, 500);
  });

});

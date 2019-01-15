$(document).on('turbolinks:load',()=>{

  function appendUser(user){
    let html = `<div class="chat-group-user clearfix">
                                <p class="chat-group-user__name">${user.name}</p>
                                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                               </div>`
    $('#user-search-result').append(html);
  }
  function appendNoUser(message){
    let html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${message}</p>
                </div>`
    $('#user-search-result').append(html);
  }
  function addUser(user_name, user_id){
    let html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${user_id}'>
                  <p class='chat-group-user__name'>${user_name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $('#chat-group-users').append(html);
  }

// ユーザーインクリメンタルサーチ
  $('#user-search-field').on('keyup', function(){
    let keyword = $(this).val();
    $.ajax({
      url: '/users',
      type: 'get',
      data: {keyword: keyword},
      dataType: 'json',
    })
    .done(function(users){
      $('#user-search-result').empty();
      if(users.length != 0){
        users.forEach(function(user){
        appendUser(user);
        })
      }else{
        appendNoUser("一致するユーザーはいません");
      }
    })
    .fail(function(){
      alert('エラーですよ');
    })
  });

// 追加ボタン押した時
  $('body').on('click', '.chat-group-user__btn--add', function(e){
    let user_name = $(this).data('user-name');
    let user_id = $(this).data('user-id');
    $(this).parent().hide();
    addUser(user_name, user_id);
  });
// 削除ボタン押した時
  $('body').on('click', '.chat-group-user__btn--remove', function(e){
    $(this).parent().remove();
    // ユーザーを追加候補に戻す処理追加できるか？
  });
});

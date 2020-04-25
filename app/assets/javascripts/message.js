$(function(){ 
  function buildHTML(message){
    if ( message.chat_image ) {
      let html =
        `<div class="message">
          <div class="message__info">
            <div class="message__info__name">
              ${message.user_name}
            </div>
            <div class="message__info__date">
              ${message.created_at}
            </div>
          </div>
          <div class="message__chat">
            <p class="message__chat__text">
              ${message.chat_message}
            </p>
            <img src=${message.chat_image} >
          </div>
        </div>`
      return html;
    } else {
      let html =
        `<div class="message">
          <div class="message__info">
            <div class="message__info__name">
              ${message.user_name}
            </div>
            <div class="message__info__date">
              ${message.created_at}
            </div>
          </div>
          <div class="message__chat">
            <p class="message__chat__text">
              ${message.chat_message}
            </p>
          </div>
        </div>`
      return html;
    };
  }
  $("#new_message").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false,
    })
      .done(function(data){
        let html = buildHTML(data);
        $(".message-lists").append(html);
        $("form")[0].reset();
        $(".message-lists").animate({ scrollTop: $(".message-lists")[0].scrollHeight})
        $(".submit-btn").prop("disabled", false);
      })
      .fail(function() {
        $(".submit-btn").prop("disabled", false);
        alert("メッセージ送信に失敗しました");
      }); 
  });
});
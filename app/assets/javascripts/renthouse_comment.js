$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_nickname}</a>
                    :
                    </strong>
                    ${comment.text}
                </p>`
    return html;
  }
  $('#renthouse_comment').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      console.log(html)
      $('.comments').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alart('エラー');
    })
    // .always(function(){
    //   $('.form__submit').prop('disabled',false);
    // })
  })
})
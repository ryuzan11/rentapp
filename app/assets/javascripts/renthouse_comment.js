$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                  <a href=/users/${comment.user_id}>${comment.user_nickname}</a>：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }

  $(document).on('ajax:success','#renthouse_comment',(e) => {
    let data = e.originalEvent.detail[0]
    let html = buildHTML(data);
    $('.comments').append(html)
    $('.textbox').val('')
  })
})
//   $('#renthouse_comment').on('submit', {passive: false}, function(e) {
//     console.log(e)
//     e.preventDefault();
//     console.log(e)
//     var formData = new FormData(this);
//     // console.log(formData)
//     var url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.comments').append(html)
//       $('.textbox').val('')
//     })
//     .fail(function(){
//       alart('エラー');
//     })
//   })
// })
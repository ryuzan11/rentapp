$(function(){
  function buildHTML(comment,user_nickname){
    var html = `<div>
                  <strong>
                  <a href=/users/${comment.user_id}>${user_nickname}</a>：
                  </strong>
                  ${comment.text}
                  <button data-modal="delete-comment${comment.id}" data-open="modal-comment" class="far fa-trash-alt""></button>
                  <aside id="delete-comment${comment.id}" class="modal-comment">
                    <div class="modal-inner modal-banner">
                      <div class="modal-body">
                        <div class="modal-head bold">確認<br>
                          削除すると二度と復活できません。<br><br>本当に削除しますか？
                        </div>
                        <p>
                        <button type="button" class="modal-btn modal-btn-cancel" data-modal="delete-comment${comment.id}" data-close="modal-comment">キャンセル</button>
                        <a class="modal-btn modal-btn-submit" rel="nofollow" data-method="delete" href="/rent_houses/${comment.rent_house_id}/comments/${comment.id}">削除する</a>
                        </p>
                      </div>
                    </div>
                  </aside>
                </div>`
    return html;
  }

  $(document).on('ajax:success','#renthouse_comment',(e) => {
    let data = e.originalEvent.detail[0]
    let comment = data.comment
    let user_nickname = data.user_nickname
    let html = buildHTML(comment,user_nickname);
    $('.comments').append(html)
    $('.textbox').val('')
  })
})
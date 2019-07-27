$(function(){
  function buildHTML(comment,user_nickname){
    var html = `<p>
                  <strong>
                  <a href=/users/${comment.user_id}>${user_nickname}</a>：
                  </strong>
                  ${comment.text}
                </p>
                <button data-modal="delete-item" data-open="modal" class="btn btn-outline-danger">削除</button>
                <aside id="delete-item" class="modal">
                  <div class="modal-inner modal-banner">
                    <div class="modal-body">
                      <div class="modal-head bold">確認<br>
                        削除すると二度と復活できません。<br><br>本当に削除しますか？
                      </div>
                      <p>
                      <button type="button" class="modal-btn modal-btn-cancel" data-modal="delete-item" data-close="modal">キャンセル</button>
                      <a class="modal-btn modal-btn-submit" rel="nofollow" data-method="delete" href="/rent_houses/${comment.rent_house_id}/comments/${comment.id}">削除する</a>
                      </p>
                    </div>
                  </div>
                </aside>`
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
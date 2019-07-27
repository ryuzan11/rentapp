$(function(){
  function like(renthouse, likes_id){
    let like = `<span class="like">
                  <form class="edit_like" 
                        id="like" 
                        data-remote="true" 
                        action="/likes/${likes_id}" 
                        accept-charset="UTF-8" 
                        method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="_method" value="delete">
                    <input type="hidden" 
                            name="authenticity_token" 
                            value="eON6XzLWsPwQYdUNRBuvm29ujzSI1T73VywBZbveTxxRWGRzmdKOpCv83wNmYQoANaqV2PzILJbhNIqU1n4uoA==">
                    <button name="button" type="submit" class="btn btn-small">
                      <i class="fas fa-star fa-large" aria-hidden="true">${renthouse.likes_count}</i>
                    </button>
                  </form>
                </span>`
    return like
  }

  $(document).on('ajax:success','.new_like', (e) => {
    let renthouse = e.originalEvent.detail[0].renthouse;
    let likes_id = e.originalEvent.detail[0].likes_id[0].id;
    let html = like(renthouse, likes_id);
    let form_id = 'renthouse-'+renthouse.id
    $('#'+form_id).html(html);
  })
})
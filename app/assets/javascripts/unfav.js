$(function(){
  function unlike(renthouse){
    let unlike = `<span class="like">
                    <form class="new_like" id="unlike" 
                          data-remote="true" action="/likes" 
                          accept-charset="UTF-8" 
                          method="post">
                      <input name="utf8" type="hidden" value="✓">
                      <input type="hidden" 
                            name="authenticity_token" 
                            value="cCNRLU4J7bzFMmgXf4gixgP37GRntJvrabHRfT80fANFM7O81Dva+Smie6iTOMwMz0erjU9EL1HWCVX8fqHSqQ==">
                      <div>
                        <input type="hidden" name="renthouse_id" id="renthouse_id" value="${renthouse.id}">
                      </div>
                      <button name="button" type="submit" class="btn btn-small">
                        <i class="far fa-star fa-large" aria-hidden="true">${renthouse.likes_count}</i>
                      </button>
                    </form>
                  </span>`

        return unlike
  }

  $(document).on('ajax:success','.edit_like', (e) => {
    let renthouse = e.originalEvent.detail[0].renthouse;
    let html = unlike(renthouse);
    $('#renthouse-'+renthouse.id).html(html);
  })
})
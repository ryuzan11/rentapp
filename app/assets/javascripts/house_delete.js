$(function(){
  $(document).on('click', '[data-open="modal"]', function(e) {
    // console.log('open')
    var modalId = $(e.target).attr('data-modal')
    // console.log(modalId)
    $('#' + modalId).addClass('is-show').addClass('is-animate')
  })
  $(document).on('click', '[data-close="modal"]', function(e) {
    // console.log('close')
    var modalId = $(e.target).attr('data-modal')
    $('#' + modalId).removeClass('is-animate').removeClass('is-show')
  })
});

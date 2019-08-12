$(document).on('click','.nav-item', function(){
  $('.show').removeClass('show');
  $(this).addClass('show');
  $('.active').removeClass('active');
  const index = $(this).index();
  $('.tab-pane').eq(index).addClass('active');
  }
)

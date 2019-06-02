$(document).on('change','#pref_edit',function() {
  var hyphen = $('<option>').val(0).text("-----");
  var pref_id = $(this).val();
  // console.log(pref_id);
  $.ajax({
    type: 'GET',
    url: '/rent_houses/get_cities',
    data: { prefecture_id: pref_id }
  })
  .done(function(data){
    // console.log(data)
    $('#city_edit').html(hyphen);
    data.forEach(function(value){
      // console.log(value)
      option = $('<option>').val(value.id).text(value.city_name);
      // console.log(option)
      $('#city_edit').append(option);
    });
  });
});

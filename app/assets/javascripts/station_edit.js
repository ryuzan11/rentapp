$(document).on('change','#pref_edit',function() {
  var hyphen = $('<option>').val(0).text("-----");
  $('#station_edit').html(hyphen);
});

$(document).on('change','#line_edit',function() {
  var line_val = $('#line_edit').val();
  var line_cd = line_val.replace(/[^0-9^\.]/g,"");
  var hyphen = $('<option>').val(0).text("-----");
  // console.log(line_val)
  // if( line_val == "" || line_val == 0 ){
  //   $('#edit_station').html(hyphen);
  // }else{
    var lineUrl = 'https://www.ekidata.jp/api/l/' + line_cd + '.json';
      // console.log(pref_num)
      console.log(lineUrl)
    $.ajax({
      url: lineUrl,
      type:'GET',
      dataType: 'script',
      timeout:1000,
      success: function(data) {
        // console.log(data)
        $('#station_edit').html(hyphen);
        xml.data.station_l.forEach(function(value){
          // console.log(value)
          option = $('<option>').text(value.station_name);
          // console.log(option)
          $('#station_edit').append(option);
        });
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        alert("ng");
        console.log("ng", XMLHttpRequest, textStatus, errorThrown);
      }
    });
  // }
});

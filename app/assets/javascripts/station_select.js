$(document).on('change','#rent_house_line_name',function() {
  var line_cd = $('#rent_house_line_name option:selected').attr('id');
  // console.log(line_cd)
  var hyphen = $('<option>').val(0).text("-----");
  // console.log(line_num)
  if( line_cd == "" || line_cd == 0 ){
    $('#rent_house_station_name').html(hyphen);
  }else{
    var stationUrl = 'https://www.ekidata.jp/api/l/' + line_cd + '.json';
    // console.log(stationUrl)
    $.ajax({
      url: stationUrl,
      type:'GET',
      dataType: 'script',
      timeout:1000,
      success: function(data) {
            $('#rent_house_station_name').html(hyphen);
            xml.data.station_l.forEach(function(value){
              option = $('<option>').text(value.station_name);
              // console.log(option)
              $('#rent_house_station_name').append(option);
            });
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("ng");
            console.log("ng", XMLHttpRequest, textStatus, errorThrown);
      }
    });
  }
})

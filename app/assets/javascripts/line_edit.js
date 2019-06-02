$(document).on('change','#pref_edit',function() {
  var pref_id = $('#pref_edit').val();
  var hyphen = $('<option>').val(0).text("-----");
  var lineUrl = 'https://www.ekidata.jp/api/p/' + pref_id + '.json';
    // console.log(pref_num)
    // console.log(lineUrl)
  $.ajax({
    url: lineUrl,
    type:'GET',
    dataType: 'script',
    timeout:1000,
    success: function(data) {
      // console.log(data)
      $('#line_edit').html(hyphen);
        xml.data.line.forEach(function(value){
          // console.log(value)
          option = $('<option>').val(value.line_cd + " : " + value.line_name).text(value.line_name);
          // console.log(option)
          $('#line_edit').append(option);
        });
      },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
      alert("ng");
      console.log("ng", XMLHttpRequest, textStatus, errorThrown);
    }
  });
})

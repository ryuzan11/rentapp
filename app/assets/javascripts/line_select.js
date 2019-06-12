$(document).on('change','#pref_select',function() {
    var pref_id = $('#pref_select').val();
    var hyphen = $('<option>').val(0).text("-----");
    if( pref_id == "" || pref_id == 0 ){
      $('#rent_house_line_name , #rent_house_station_name').html(hyphen);
    }else{
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
              $('#rent_house_line_name').html(hyphen);
              xml.data.line.forEach(function(value){
                // console.log(value)
                option = $('<option>').val(value.line_cd + " : " + value.line_name).text(value.line_name);
                // console.log(option)
                $('#rent_house_line_name').append(option);
              });
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
              alert("ng");
              console.log("ng", XMLHttpRequest, textStatus, errorThrown);
        }
      });
    }
  })


// 駅データjp
// var xml = {};
// function setMenuItem(type,code){

//   var s = document.getElementsByTagName("head")[0].appendChild(document.createElement("script"));
//   s.type = "text/javascript";
//   s.charset = "utf-8";

//   var optionIndex0 = document.form.s0.options.length; //沿線のOPTION数取得
//   var optionIndex1 = document.form.s1.options.length; //駅のOPTION数取得

//   if (type == 0){
//     for ( i=0 ; i <= optionIndex0 ; i++ ){document.form.s0.options[0]=null} //沿線削除
//     for ( i=0 ; i <= optionIndex1 ; i++ ){document.form.s1.options[0]=null} //駅削除
//     document.form.s1.options[0] = new Option("-----",0); //駅OPTIONを空に
//       if (code == 0){
//         document.form.s0.options[0] = new Option("-----",0); //沿線OPTIONを空に
//       }else{
//         s.src = "http://www.ekidata.jp/api/p/" + code + ".json";  //沿線JSONデータURL
//       }
//   }else{
//     for ( i=0 ; i <= optionIndex1 ; i++ ){document.form.s1.options[0]=null} //駅削除
//       if (code == 0){
//         document.form.s1.options[0] = new Option("-----",0); //駅OPTIONを空に
//       }else{
//         s.src = "http://www.ekidata.jp/api/l/" + code + ".json";  //駅JSONデータURL
//       }
//   }

//   xml.onload = function(data){
//   var line = data["line"];
//   var station_l = data["station_l"];
//   if(line != null){
//     document.form.s0.options[0] = new Option("-----",0); //OPTION1番目はNull
//     for( i=0; i<line.length; i++){
//       ii = i + 1  //OPTIONは2番目から表示
//       var op_line_name = line[i].line_name;
//       var op_line_cd = line[i].line_cd;
//       document.form.s0.options[ii] = new Option(op_line_name,op_line_cd);
//     }
//   }
//   if(station_l != null){
//     document.form.s1.options[0] = new Option("-----",0); //OPTION1番目はNull
//     for( i=0; i<station_l.length; i++){
//       ii = i + 1  //OPTIONは2番目から表示
//       var op_station_name = station_l[i].station_name;
//       var op_station_cd = station_l[i].station_cd;
//       document.form.s1.options[ii] = new Option(op_station_name,op_station_cd);
//     }
//   }
// }
// }

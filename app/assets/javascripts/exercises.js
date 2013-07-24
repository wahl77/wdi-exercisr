// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('#Activity').change(function(event) {
    val = $('#Activity').val(); 
    options = {
      url: "/exercise/data",
      data: {
        activity: val
      },
      dataType: "json",

      complete: function(response){
        $('#chart').empty();
        console.log(response.responseText);
        info = $.parseJSON(response.responseText);
        abc = []
        for (var i = 0; i < info.length; ++i){
          abc.push({
            day: info[i].completed,
            value: info[i].value
            });
        }
        plot(abc);
      }
    }

    $.ajax(options);
  });


  function plot(data){
    console.log(data);
    a = Morris.Line({
          parseTime: false,
          element: 'chart',
          data: data,
          xkey: 'day',
          ykeys: ['value'],
          labels: ['value']
        });
  }
});

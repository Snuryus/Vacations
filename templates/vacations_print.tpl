<form class='form-horizontal'>
  <input type='hidden' name='index' value='$index'>
  <input type='hidden' name='sid' value='$sid'>
  <div class='box box-theme box-form text-center'>
    <div class='box-body'>
      <div class='row'>
          Начало отпуска: <b>%VCT_START%</b><br>
          Длительность отпуска: <b>%VCT_USE_DAYS%</b> календарных дней</b><br>
          Окончание отпуска: <b>%VCT_END%</b><br>
          <br>
          <div class="checkbox">
            <label><input type="checkbox" id='req_auto'>предоставить служебный автомобиль</label>
          </div>
          <br>
          <p id='button1'>%PRINT_BUTTON1%</p>
          <p id='button2' hidden>%PRINT_BUTTON2%</p>
      </div>
    </div>
  </div>
</form>
<script type="text/javascript">
  \$('#req_auto').click(function(){
    console.log(1);
    if(\$('#req_auto').is(':checked')) {
      console.log(2);
      \$('#button1').hide();
      \$('#button2').show();
    }
    else {
      console.log(3);
      \$('#button2').hide();
      \$('#button1').show();
    }
  });
</script>

<form class='form-horizontal' name='emp_chg'>
<input type='hidden' name='index' value='$index'>
<input type='hidden' name='TID' value='$FORM{EDIT}'>
<input type='hidden' name='sid' value='$sid'>
<div class='row'>
  <div class='box box-theme box-form'>
    <div class='box-header with-border'><h3 class='box-title'>Редактирование %SURNAME%</h3></div>
    <div class='box-body'>
      <div class='form-group'>
      <div class='col-md-12'><b>ФИО (в родительном падеже)</b></div>
        <div class='col-md-12'>
          <input class='form-control' type='text' name='SURNAME_GENETIVE' value='%OLD_SURNAME%'>
        </div>
      </div>
      <div class='form-group'>
      <div class='col-md-12'><b>Неиспользовано дней отпуска на 30.06.2017</b></div>
        <div class='col-md-12'>
          <input class='form-control' type='text' name='VCT_LEFT' value='%VCT_LEFT%'>
        </div>
      </div>
      <div class='form-group'>
      <div class='col-md-12'><b>Заработано дней отпуска до 31.12.2017</b></div>
        <div class='col-md-12'>
          <input class='form-control' type='text' name='VCT_EARNED' value='%VCT_EARNED%'>
        </div>
      </div>
    </div>
    <div class='box-footer'>
      <input type=submit name='change' value='Изменить' class='btn btn-primary'>
    </div>  
  </div>
</div>
</form>


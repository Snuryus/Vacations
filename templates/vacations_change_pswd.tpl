<form class='form-horizontal' name='email_change'>
<input type='hidden' name='index' value='$index'>
<input type='hidden' name='CHG_PSWD' value='%CHG_PSWD%'>
<input type='hidden' name='sid' value='$sid'>
<div class='row'>
  <div class='box box-theme box-form'>
    <div class='box-header with-border'><h3 class='box-title'>Новый пароль для пользователя %SURNAME%</h3></div>
    <div class='box-body'>
      <div class='form-group'> 
        <div class='col-md-12'>
          <input class='form-control' type='text' name='NEW_PSWD'>
        </div>
      </div>
      <div class="checkbox">
        <label><input type="checkbox" name='SEND_EMAIL' value="1">Выслать пароль пользователю</label>
      </div>
    </div>
    <div class='box-footer'>
      <input type=submit name='change' value='Изменить' class='btn btn-primary'>
    </div>  
  </div>
</div>
</form>


<form class='form-horizontal' name='email_change'>
<input type='hidden' name='index' value='$index'>
<input type='hidden' name='CHG_EMAIL' value='%CHG_EMAIL%'>
<input type='hidden' name='sid' value='$sid'>
<div class='row'>
  <div class='box box-theme box-form'>
    <div class='box-header with-border'><h3 class='box-title'>Новый e-mail для пользователя %SURNAME%</h3></div>
    <div class='box-body'>
      <div class='form-group'> 
        <div class='col-md-12'>
          <input class='form-control' type='text' name='NEW_EMAIL' value='%EMAIL%'>
        </div>
      </div>
    </div>
    <div class='box-footer'>
      <input type=submit name='change' value='Изменить' class='btn btn-primary'>
    </div>  
  </div>
</div>
</form>


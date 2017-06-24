<FORM action='$SELF_URL' ID='REG' class='form-horizontal'>
  <input type='hidden' name='index' value='$index'>
  <input type='hidden' name='sid' value='$sid'>
  <div class='box box-primary box-theme box-form' style="width: 300px;">
    <div class='box-header with-border'>
      <h3 class='box-title'>Новый пользователь</h3>
    </div>
    <div class='box-body'>
      <div class='row'>
        <div class='col-md-12'>
          <div class="form-group">
            <input id='SURNAME' name='SURNAME' value='%SURNAME%' class='form-control' type='text'>
          </div>
          <div class="form-group">
            <input id='TID' name='TID' value='%TID%' class='form-control' type='text'>
          </div>
          <div class="form-group">
            <input id='EMAIL' name='EMAIL' value='%EMAIL%' placeholder='E-MAIL' class='form-control' type='text'>
          </div>
          <div class="checkbox">
            <label><input type="checkbox" name='SEND_EMAIL' value="1">Выслать пароль пользователю</label>
          </div>
        </div>
      </div>
    </div>
    <div class='box-footer'>
      <input type=submit name='reg' value='Создать пользователя' class='btn btn-success btn-block'>  
    </div>


  </div>
</FORM>

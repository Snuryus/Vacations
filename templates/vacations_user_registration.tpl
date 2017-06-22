
<link href='/styles/default_adm/css/client.css' rel='stylesheet'>

<FORM action='$SELF_URL' METHOD=POST ID='REGISTRATION' class='form-horizontal'>
  <input type='hidden' name='module' value='Vacations'>
  <br>
  <div class='box box-primary box-theme box-form' style="width: 300px;">
    <div class='box-header with-border'>
      <h3 class='box-title'>Новый пользователь</h3>
    </div>
    <div class='box-body'>
      <div class='row'>
        <div class='col-md-12'>
          <div class="form-group-lg">
            <input id='SURNAME' name='SURNAME' value='%SURNAME%' placeholder='Фамилия (українською)' class='form-control' type='text'>
          </div>
          <br>
          <div class="form-group-lg">
            <input id='TID' name='TID' value='%TID%' placeholder='Табельный номер' class='form-control' type='text'>
          </div>
          <div class="form-group">
            <input id='EMAIL' name='EMAIL' value='%EMAIL%' placeholder='E-MAIL' class='form-control' type='text'>
          </div>
        </div>
      </div>
    </div>

    <div class='box-footer'>
      <input type=submit name=reg value='Зарегистрироваться' class='btn btn-lg btn-success btn-block'>  
    </div>


  </div>
</FORM>

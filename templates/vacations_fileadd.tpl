<FORM action='$SELF_URL' METHOD='POST' enctype='multipart/form-data' class='form-horizontal'>
<input type='hidden' name='index' value='$index'>

<fieldset>
  <div class='box box-theme'>
    <div class='box-header with-border'><h3 class='box-title'>Загрузка файлов</h3>
      <div class='box-tools pull-right'>
      <button type='button' class='btn btn-default btn-xs' data-widget='collapse'>
      <i class='fa fa-minus'></i>
        </button>
      </div>
    </div>
    <div class='box-body'>
      <div class='col-md-12'>
        <div class='form-group'>
          <input id='FILE_DATA' name='FILE_UPLOAD' value='%FILE_UPLOAD%' placeholder='%FILE_DATA%' class='input-file' type='file'>
        </div>
        <input class='btn btn-primary' type='submit' name='UPLOAD' value='_{ADD}_'>
      </div>
    </div>
  </div>
</fieldset>
</FORM>


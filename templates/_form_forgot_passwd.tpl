<div class='row'>
    <form action='$SELF_URL' method='post' name='reg_request_form' class='form form-horizontal'>

        <input type='hidden' name='FORGOT_PASSWD' value='1'>

        <div class='box box-theme box-form center-block'>
            <div class='box-header with-border'><h4 class='box-title'>_{PASSWORD_RECOVERY}_</h4></div>

            <div class='box-body'>

                <div class='form-group'>

                    <label class='control-label col-md-5' for='LOGIN'>Табельный номер</label>
                    <div class='col-md-7'>
                        <input type='text' class='form-control' id='LOGIN' name='LOGIN' value='%LOGIN%'/>
                    </div>
                </div>

                <div class='form-group'>
                    <label class='control-label required col-md-5' for='EMAIL'>E-mail</label>
                    <div class='col-md-7'>
                        <input type='text' class='form-control' id='EMAIL' name='EMAIL' value='%EMAIL%'/>
                    </div>
                </div>
            </div>

            <div class='box-footer text-right'>
                <input type='submit' class='btn btn-primary' name='SEND' value='_{SEND}_'/>
            </div>
        </div>
    </form>
</div>
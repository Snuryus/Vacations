<style type="text/css">
  .datepicker table tr td {
    color: #2fcc34;
    font-weight: bold;
  }
  .datepicker table tr td.old,
  .datepicker table tr td.new {
    color: #9fe48f;
  }
  .datepicker table tr td.disabled,
  .datepicker table tr td.disabled:hover {
    background: none;
    color: #444;
    cursor: default;
    font-weight: normal;
  }
  .datepicker table tr td.disabled-date,
  .datepicker table tr td.disabled-date:hover {
    background: none;
    color: #dd4b39;
    cursor: default;
    font-weight: normal;
  }
  .datepicker table tr td.active,
  .datepicker table tr td.active.active,
  .datepicker table tr td.active:hover,
  .datepicker table tr td.active:hover.active,
  .datepicker table tr td.active:hover.active:hover {
  	background: #10ad00
  }
  .datepicker table tr td.day:hover,
  .datepicker table tr td.day.focused {
    background: rgba(0,0,0,0.2);
  }

  </style>

<form class='form-horizontal'>
  <input type='hidden' name='index' value='$index'>
  <input type='hidden' name='VACATION_REQUEST' value='1'>
  <input type='hidden' name='sid' value='$sid'>
  <div class='box box-theme box-form text-center'>
    <div class='box-body'>
      <div class='row'>
        <div class='col-md-6'>
          <b>Выберите дату начала отпуска</b>
        </div>
        <div class='col-md-4'>
          <input name='VCT_START' id='datepicker1'>
        </div>
        <div class='col-md-2'>
          <input type=submit name='next' value='Дальше' class='btn-xs btn-primary'>
        </div>
      </div>
    </div>
</form>
<script type="text/javascript">
  \$('#datepicker1').datepicker({
  	format: "yyyy-mm-dd",
    language: 'ru',
    startDate: "%START%",
    endDate: "%END%",
    datesDisabled: [%DISABLE_DATES%],
    orientation: "bottom",
	weekStart: 1
  });
</script>

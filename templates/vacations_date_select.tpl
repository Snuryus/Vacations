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
    color: #bfbfbf;
    cursor: default;
    font-weight: normal;
  }
  .datepicker table tr td.disabled-date,
  .datepicker table tr td.disabled-date:hover {
    background: none;
    color: #bfbfbf;
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

<form class='form-horizontal' id='dateform'>
  <input type='hidden' name='index' value='$index'>
  <input type='hidden' name='VACATION_REQUEST' value='1'>
  <input type='hidden' name='sid' value='$sid'>
  <div class='box box-theme box-form text-center'>
    <div class='box-body'>
      <div class='row'>
        <div class='col-md-6'>
          <b>Дата начала отпуска</b>
        </div>
        <div class='col-md-6'>
          <b>Дата окончания отпуска</b>
        </div>
      </div>
      <div class='row'>
        <div class='col-md-6'>
          <input hidden name='VCT_START' value="%VCT_START%" id="vct_start" readonly>
        </div>
        <div class='col-md-6'>
          <input hidden name='VCT_END' value="%VCT_END%" id="vct_end" readonly>
        </div>
      </div>
      <div class='row'>
        <div class='col-md-6'>
          %DATEPICKER1%
        </div>
        <div class='col-md-6'>
          %DATEPICKER2%
        </div>
      </div>
      <!--div class='row'>
        <div class='col-md-6'>
          %BUTTON1%
        </div>
        <div class='col-md-6'>
          %BUTTON2%
        </div>
      </div-->
    </div>
</form>
<script type="text/javascript">
  \$('#datepicker1').datepicker({
  	format: "yyyy-mm-dd",
    language: 'ru',
    startDate: "%STARTD%",
    endDate: "%END%",
    datesDisabled: [%DISABLE_DATES%],
    orientation: "bottom",
	  weekStart: 1
  });
  
  \$('#datepicker2').datepicker({
  	format: "yyyy-mm-dd",
    language: 'ru',
    startDate: "%STARTD2%",
    endDate: "%END2%",
    datesDisabled: [%DISABLE_DATES2%],
    orientation: "bottom",
	  weekStart: 1
  });
  
  \$('#datepicker1').on('changeDate', function() {
    \$('#vct_start').val(
        \$('#datepicker1').datepicker('getFormattedDate')
    );
    \$('#vct_end').val('');
    \$('#dateform').submit();
  });
  
  \$('#datepicker2').on('changeDate', function() {
    \$('#vct_end').val(
        \$('#datepicker2').datepicker('getFormattedDate')
    );
    \$('#dateform').submit();
  });


</script>

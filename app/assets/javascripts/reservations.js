$(document).on('ready page:load', function() {
  $("input[name='reservation[dates]']").daterangepicker({
  	locale: {
  				applyLabel: 'Done',
          cancelLabel: 'Clear'
      },
  	minDate: moment()
    });

  $("input[name='reservation[dates]']").on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
  });

  $("input[name='reservation[dates]']").on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

	$("select").on('change', function(){
		var price = parseInt($('.book_price').attr('id'), 10);
		$('.book_price').html($(this).val()*price);
	});
});
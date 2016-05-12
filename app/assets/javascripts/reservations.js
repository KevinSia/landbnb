$(document).on('ready page:load', function() {
  var startDate = moment();
  var endDate = moment().add(1, 'days');
  var calculatePrice = function(){
    // price per night, charge extra if over pax limit
    // date be changed to not allow same date
    var price = parseInt($('.book_price').attr('id'), 10);
    var date_diff = endDate.diff(startDate, 'days');
    // $('select').val()
    $('.book_price').html(price * date_diff);
  }
  calculatePrice();

  $("input[name='reservation[dates]']").daterangepicker({
  	locale: {
          format: 'DD/MM/YYYY',
          cancelLabel: 'Clear'
      },
  	minDate: moment(),
    endDate: moment().add(1, 'days'),
    drops: 'up',
    autoApply: true,
    autoUpdateInput: true
    });

  $("input[name='reservation[dates]']").on('hide.daterangepicker', function(ev, picker) {
      startDate = picker.startDate;
      if (picker.endDate.diff(startDate, 'days') === 0){
        picker.endDate = picker.endDate.add(1, 'days');
      }
      endDate = picker.endDate;
      calculatePrice();
  });

  $("input[name='reservation[dates]']").on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
  });

  $("input[name='reservation[dates]']").on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

	// $("select").on('change', function(){
 //    calculatePrice();
	// });
});
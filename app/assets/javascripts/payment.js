$(document).on('ready page:load', function() {
	var token = $('#dropin').data('token')
	if ( token === undefined ){
		$('#dropin').html('Unable to load');
	}
	else {
 	  braintree.setup(token, 'dropin', { container: 'dropin' });
	}
});
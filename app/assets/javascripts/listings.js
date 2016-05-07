// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load', function() {
  return CountryStateSelect({
    country_id: "listing_country",
    state_id: "listing_state",
    city_id: "listing_city",
    city_place_holder: "Please select city",
    state_place_holder: "Please select state"
  });
});
var editShop = function(){
  $('body').on('click', '.edit-information', function(e){
    e.preventDefault();
    var parent_row_id = $(this).closest('tr').prop('id');
    $('#edit-form #name').val($('#name_'+ parent_row_id).html());
    $('#edit-form #location').val($('#location_'+ parent_row_id).html());
    $('#edit-form').attr('action', '/shops/'+parent_row_id);
    $('#edit_shop').modal('show');
  });

}
var createShop = function(){
  $('body').on('click', '#add-shop', function(e){
    e.preventDefault();
    $('#new_shop_form #name').val('');
    $('#new_shop_form #location').val('');
    $('#new_shop').modal('show');
  });
}

var uploadDirectoryFile = function(){
  $('body').on('click', '#upload-directory-btn', function(e){
    e.preventDefault();
    $('#upload_directory').modal('show');
  });
}
$(document).ready(function() {
  createShop();
  editShop();
  uploadDirectoryFile();
  $(document).ajaxStart(function() {
    $("#ajax_indicator").show();
  });

  $(document).ajaxError(function(){
    $("#ajax_indicator").hide();
  });

  $(document).ajaxComplete(function() {
    $("#ajax_indicator").hide();
  });
});
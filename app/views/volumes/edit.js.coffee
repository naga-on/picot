
$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/volume', locals: {volume: @volume, path: volumes_edit_path}
) %>")
$("#myModal").modal()


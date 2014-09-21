
$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/volume', locals: {volume: @volume, path: volumes_new_path}
) %>")
$("#myModal").modal()


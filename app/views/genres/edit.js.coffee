
$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/genre', locals: {genre: @genre, path: genres_edit_path}
) %>")
$("#myModal").modal()


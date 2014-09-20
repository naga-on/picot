
$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/genre', locals: {genre: @genre, path: genres_new_path}
) %>")
$("#myModal").modal()


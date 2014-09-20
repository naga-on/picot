
$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/book', locals: {book: @book, path: books_edit_path}
) %>")
$("#myModal").modal()



$("#myModal").html("<%= escape_javascript(
  render partial: 'shared/modal/book', locals: {book: @book, path: books_new_path}
) %>")
$("#myModal").modal()


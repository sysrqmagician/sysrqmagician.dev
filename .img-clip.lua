return {
  filetypes = {
    markdown = {
      dir_path = "static/assets",
      template = "<figure>\n<img src=\"/assets/$FILE_NAME\" alt=\"$CURSOR\">\n<figcaption></figcaption>\n</figure>"
    }
  }
}

quarto::quarto_render(as_job = FALSE)

# change some yml fields before rendering english book

en_yml <- yaml::read_yaml("_quarto.yml")
en_yml$lang <- "en"
en_yml$crossref <- NULL
en_yml$book$chapters <- lapply(
  en_yml$book$chapters,
  function(x) {
    if (is.character(x)) {
      gsub("\\.qmd", ".en.qmd", x)
    } else {
      list(
        part = gsub("\\.qmd", ".en.qmd", x$part),
        chapters = as.list(gsub("\\.qmd", ".en.qmd", x$chapters))
      )
    }
  }
)

yaml::write_yaml(
  en_yml,
  "en_book/_quarto.yml",
  handlers = list(
    logical = function(x) {
      result <- ifelse(x, "true", "false")
      class(result) <- "verbatim"
      return(result)
    }
  )
 )

quarto::quarto_render("en_book", as_job = FALSE)

fs::dir_copy("en_book/_book", "_book/en")

# add link to english version in portuguese chapters

pt_html <- fs::dir_ls("_book", glob = "*.html")

invisible(lapply(
  pt_html,
  function(html_page) {
    content <- xml2::read_html(html_page)
    sidebar <- xml2::xml_find_all(content, "//div[@id='quarto-margin-sidebar']")
    
    xml2::xml_add_child(
      sidebar,
      "a",
      "Read in English",
      href = paste0("en/", sub("\\.html", ".en.html", basename(html_page)))
    )
    
    xml2::write_html(content, html_page)
  }
))

# add link to portuguese version in english chapters

en_html <- fs::dir_ls("_book/en", glob = "*.html")

invisible(lapply(
  en_html,
  function(html_page) {
    content <- xml2::read_html(html_page)
    sidebar <- xml2::xml_find_all(content, "//div[@id='quarto-margin-sidebar']")
    
    xml2::xml_add_child(
      sidebar,
      "a",
      "Leia em português",
      href = paste0("../", sub("\\.en\\.html", ".html", basename(html_page)))
    )
    
    xml2::write_html(content, html_page)
  }
))
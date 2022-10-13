# This script builds both the HTML and PDF versions of your CV

##
## Full CV
##
render_full_cv <- function(in.scripts="scripts", out.docs="../cv"){
  print(paste(out.docs, "/cv.html", sep=''))
  # Knit the HTML version
  rmarkdown::render(paste(in.scripts, "/cv.rmd", sep=''),
                    params = list(pdf_mode = FALSE),
                    output_file = paste(out.docs, "/cv.html", sep=''))
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render(paste(in.scripts, "/cv.rmd", sep=''),
                    params = list(pdf_mode = TRUE),
                    output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc,
                         output = "cv/cv.pdf")
}

##
## Short CV
##
render_short_cv <- function(in.scripts="scripts", out.docs="../cv"){
  # Knit the HTML version
  rmarkdown::render(paste(in.scripts, "/cv_short.rmd", sep=''),
                    params = list(pdf_mode = FALSE),
                    output_file = paste(out.docs, "/cv_short.html", sep=''))
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render(paste(in.scripts, "/cv_short.rmd", sep=''),
                    params = list(pdf_mode = TRUE),
                    output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc,
                         output = paste(out.docs, "/cv_short.pdf", sep=''))
}
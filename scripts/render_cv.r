# This script builds both the HTML and PDF versions of your CV

##
## Full CV
##
render_full_cv <- function(){
  # Knit the HTML version
  rmarkdown::render("scripts/cv.rmd",
                    params = list(pdf_mode = FALSE),
                    output_file = "../cv/cv.html")
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render("scripts/cv.rmd",
                    params = list(pdf_mode = TRUE),
                    output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc,
                         output = "cv/cv.pdf")
}

##
## Short CV
##
render_short_cv <- function(){
  # Knit the HTML version
  rmarkdown::render("scripts/cv_short.rmd",
                    params = list(pdf_mode = FALSE),
                    output_file = "../cv/cv_short.html")
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render("scripts/cv_short.rmd",
                    params = list(pdf_mode = TRUE),
                    output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc,
                         output = "cv/cv_short.pdf")
}
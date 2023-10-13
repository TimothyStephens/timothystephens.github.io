
source("render_cv.r")
render_full_cv()
render_short_cv()
file.copy("../cv/cv.pdf", "../cv/Timothy_Stephens_CV.pdf", overwrite=TRUE)

source("render_website.r")
render_site_talks()
render_site_teaching()
render_site_media()
render_site_code()
render_site_publications()

print(paste("Update pages on", Sys.time()))


source("scripts/render_cv.r")
render_full_cv()
#render_short_cv()
file.copy("cv/cv.pdf", "cv/Timothy_Stephens_CV.pdf", overwrite=TRUE)

source("scripts/render_website.r")
render_sites()

cat(paste("Update pages on", Sys.time()))

# git add --all && git commit -m "Update `date`" && git push
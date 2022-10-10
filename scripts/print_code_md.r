suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(knitr)))
suppressWarnings(suppressMessages(library(lubridate)))

print('## Creating website markdown file: Code')

out.file <- "../_pages/code.md"
out.txt <- ""

#### cv entries #####
suppressMessages(
  cv_entries <- read_csv("../cv_entries.csv") %>%
    filter(type %in% c('software', 'github_repo'))
)

out.txt <- paste(out.txt, sep='', '---\n')
out.txt <- paste(out.txt, sep='', 'title: "Code"\n')
out.txt <- paste(out.txt, sep='', 'permalink: /code/\n')
out.txt <- paste(out.txt, sep='', 'author_profile: true\n')
out.txt <- paste(out.txt, sep='', 'encoding: UTF-8\n')
out.txt <- paste(out.txt, sep='', '---\n')
out.txt <- paste(out.txt, sep='', '\n')
out.txt <- paste(out.txt, sep='', '{% include base_path %}\n')
out.txt <- paste(out.txt, sep='', '\n')
out.txt <- paste(out.txt, sep='', '<style>\n')
out.txt <- paste(out.txt, sep='', 'ul {\n')
out.txt <- paste(out.txt, sep='', '  list-style-type: none;\n')
out.txt <- paste(out.txt, sep='', '}\n')
out.txt <- paste(out.txt, sep='', '</style>\n')
out.txt <- paste(out.txt, sep='', '\n')

tmp <- cv_entries %>% filter(type == 'github_repo')
out.txt <- paste(out.txt, sep='', '<div class="github-card" data-github="', tmp$what, '" data-width="400" data-height="318" data-theme="medium"></div>\n')
out.txt <- paste(out.txt, sep='', '<script src="//cdn.jsdelivr.net/github-cards/latest/widget.js"></script>\n')
out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
  

tmp <- cv_entries %>% filter(type == 'software')
count <- nrow(tmp)
for (i in 1:count) {
  out.txt <- paste(out.txt, sep='', "# ", tmp[i,]$what, '\n')
  out.txt <- paste(out.txt, sep='', tmp[i,]$additional_info, '\n')
  out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
  out.txt <- paste(out.txt, sep='', '<div class="github-card" data-github="', tmp[i,]$where, '" data-width="400" data-height="279" data-theme="medium"></div>\n')
  out.txt <- paste(out.txt, sep='', '<script src="//cdn.jsdelivr.net/github-cards/latest/widget.js"></script>\n')
  out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
}

write(out.txt, out.file)

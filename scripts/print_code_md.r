suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(knitr)))
suppressWarnings(suppressMessages(library(lubridate)))

print('## Creating website markdown file: Code')

out.file <- "../_pages/code.md"
out.txt <- ""

#### cv entries #####
suppressMessages(
  cv_entries <- read_csv("../cv_entries.csv") %>%
    filter(type == 'software')
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

count <- nrow(cv_entries)
for (i in 1:count) {
  out.txt <- paste(out.txt, sep='', "# ", cv_entries[i,]$what, '\n')
  out.txt <- paste(out.txt, sep='', cv_entries[i,]$additional_info, '\n')
  out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
}

write(out.txt, out.file)

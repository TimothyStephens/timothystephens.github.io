suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(knitr)))
suppressWarnings(suppressMessages(library(lubridate)))

print('## Creating website markdown file: Media')

out.file <- "../_pages/media.md"
out.txt <- ""

#### cv entries #####
suppressMessages(
  cv_entries <- read_csv("../cv_entries.csv") %>%
    filter(type %in% c('media', 'video')) %>%
    filter(include_in_full_cv == 'y') %>%
    mutate(date_start=paste(date_start_year, date_start_month, date_start_day, sep='-')) %>%
    mutate(date_end=paste(date_end_year, date_end_month, date_end_day, sep='-')) %>%
    mutate(year_begin = date_start_year) %>%
    mutate(year_end = date_end_year) %>%
    mutate(year = ifelse((is.na(year_end) | year_begin == year_end),
                         year_begin,
                         str_c(year_begin, " --- ", year_end)))
)

out.txt <- paste(out.txt, sep='', '---\n')
out.txt <- paste(out.txt, sep='', 'title: "Media"\n')
out.txt <- paste(out.txt, sep='', 'permalink: /media/\n')
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
n <- 0
for (select_year in sort(unique(cv_entries$year), decreasing=T)) {
  tmp <- cv_entries %>% filter(year == select_year)
  out.txt <- paste(out.txt, sep='', '## ', select_year, '\n\n')
  for (i in 1:nrow(tmp)) {
    out.txt <- paste(out.txt, sep='', "### ", (count-n), '\\. ', tmp[i,]$what, '\n')
    t <- tmp[i,] %>% mutate(ref2print = '') %>% 
      mutate(ref2print = ifelse(!is.na(additional_info), 
                                str_c(ref2print, additional_info), 
                                ref2print)
      )
    out.txt <- paste(out.txt, sep='', t$ref2print, '\n')
    out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
    n<-n+1
  }
}

write(out.txt, out.file)

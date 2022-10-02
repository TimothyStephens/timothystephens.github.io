library(tidyverse)
library(knitr)
library(lubridate)

out.file <- "../_pages/publications.md"
out.txt <- ""

#### publications #####
publications <- read_csv("../publications.csv") %>%
  filter(include_in_full_cv == 'y')


## Publications
p <- publications %>%
  arrange(desc(date)) %>%
  mutate(year = year(date)) %>%
  mutate(ref2print = str_c(authors_full, " ", title, ". *", journal, "*")) %>%
  mutate(ref2print = ifelse(!is.na(ref_info), 
                            str_c(ref2print, ", ", ref_info, ", ", year(date), "."), 
                            str_c(ref2print, ", ", year(date), "."))
         ) %>%
  mutate(ref2print = ifelse(!is.na(preprint), 
                            str_c(ref2print, " [[Preprint](", preprint, ")]"), 
                            ref2print)
         ) %>%
  mutate(ref2print = ifelse(!is.na(additional_info), 
                            str_c(ref2print, " ", additional_info), 
                            ref2print)
         ) %>%
  mutate(ref2print = ifelse(!is.na(url), 
                            str_c(ref2print, " [[URL](", url, ")]"), 
                            ref2print)
         ) %>%
  mutate(ref2print = ifelse(!is.na(pdf), 
                            str_c(ref2print, " [[PDF](", pdf, ")]"), 
                            ref2print)
         ) %>%
  arrange(desc(date))

out.txt <- paste(out.txt, sep='', '---\n')
out.txt <- paste(out.txt, sep='', 'title: "Publications"\n')
out.txt <- paste(out.txt, sep='', 'permalink: /publications/\n')
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

pub.count <- nrow(p)
n <- 0
for (select_year in sort(unique(p$year), decreasing=T)) {
  tmp <- p %>% filter(year == select_year)
  out.txt <- paste(out.txt, sep='', "## ", select_year, "\n\n")
  for (i in 1:nrow(tmp)) {
    print (pub.count-n)
    out.txt <- paste(out.txt, sep='', (pub.count-n), ". ", tmp[i,]$ref2print, "\n\n")
    n<-n+1
  }
}

out.txt
write(out.txt, out.file)

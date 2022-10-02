library(tidyverse)
library(knitr)
library(lubridate)

out.file <- "../_pages/cv.md"
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

out.txt <- paste(out.txt, sep='', "---\n")
out.txt <- paste(out.txt, sep='', "  layout: archive\n")
out.txt <- paste(out.txt, sep='', "title: \"CV\"\n")
out.txt <- paste(out.txt, sep='', "permalink: /cv/\n")
out.txt <- paste(out.txt, sep='', "  author_profile: true\n")
out.txt <- paste(out.txt, sep='', "redirect_from:\n")
out.txt <- paste(out.txt, sep='', "  - /resume\n")
out.txt <- paste(out.txt, sep='', "---\n\n")
out.txt <- paste(out.txt, sep='', "{% include base_path %}\n\n")

pub.count <- nrow(p)
n <- 0
for (select_year in sort(unique(p$year), decreasing=T)) {
  tmp <- p %>% filter(year == select_year)
  out.txt <- paste(out.txt, sep='', "## ", select_year, "\n\n")
  for (i in 1:nrow(tmp)) {
    n<-n+1
    print (pub.count-n)
    out.txt <- paste(out.txt, sep='', (pub.count-n), ". ", tmp[i,]$ref2print, "\n\n")
  }
}

out.txt
write(out.txt, out.file)

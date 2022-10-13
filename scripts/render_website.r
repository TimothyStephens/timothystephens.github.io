suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(knitr)))
suppressWarnings(suppressMessages(library(lubridate)))


######################
####     Talks    ####
######################
render_site_talks <- function(in.csv="cv_entries.csv", out.file="_pages/talks.md", out.txt=""){
  print('## Creating website markdown file: Talks')
  
  #### cv entries #####
  suppressMessages(
    cv_entries <- read_csv(in.csv) %>%
      filter(type %in% c('talk', 'poster')) %>%
      filter(include_in_full_cv == 'y') %>%
      mutate(date_start=paste(date_start_year, date_start_month, date_start_day, sep='-')) %>%
      mutate(date_end=paste(date_end_year, date_end_month, date_end_day, sep='-')) %>%
      mutate(year_begin = date_start_year) %>%
      mutate(year_end = date_end_year) %>%
      mutate(year = ifelse((is.na(year_end) | year_begin == year_end),
                           year_begin,
                           str_c(year_begin, " --- ", year_end))) %>%
      arrange(desc(date_start))
  )
  
  out.txt <- paste(out.txt, sep='', '---\n')
  out.txt <- paste(out.txt, sep='', 'title: "Talks and posters"\n')
  out.txt <- paste(out.txt, sep='', 'permalink: /talks/\n')
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
      out.txt <- paste(out.txt, sep='', (count-n), '\\. ', tmp[i,]$what, ' [**', tmp[i,]$type, '**]\n')
      out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
      n<-n+1
    }
  }
  
  write(out.txt, out.file)
}





######################
####   Teaching   ####
######################
render_site_teaching <- function(in.csv="cv_entries.csv", out.file="_pages/teaching.md", out.txt=""){
  print('## Creating website markdown file: Teaching')
  
  #### cv entries #####
  suppressMessages(
    cv_entries <- read_csv(in.csv) %>%
      filter(type == 'teaching') %>%
      filter(include_in_full_cv == 'y') %>%
      mutate(date_start=paste(date_start_year, date_start_month, date_start_day, sep='-')) %>%
      mutate(date_end=paste(date_end_year, date_end_month, date_end_day, sep='-')) %>%
      mutate(year_begin = date_start_year) %>%
      mutate(year_end = date_end_year) %>%
      mutate(year = ifelse((is.na(year_end) | year_begin == year_end),
                           year_begin,
                           str_c(year_begin, " --- ", year_end))) %>%
      arrange(desc(year))
  )
  
  out.txt <- paste(out.txt, sep='', '---\n')
  out.txt <- paste(out.txt, sep='', 'title: "Teaching"\n')
  out.txt <- paste(out.txt, sep='', 'permalink: /teaching/\n')
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
    for (i in 1:nrow(tmp)) {
      out.txt <- paste(out.txt, sep='', "### ", (count-n), '\\. ', tmp[i,]$what, ', ', tmp[i,]$where, ' (', tmp[i,]$year_begin, '-', tmp[i,]$year_end, ')', '\n')
      out.txt <- paste(out.txt, sep='', tmp[i,]$additional_info, '\n')
      out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
      n<-n+1
    }
  }
  
  write(out.txt, out.file)
}





######################
####     Media    ####
######################
render_site_media <- function(in.csv="cv_entries.csv", out.file="_pages/media.md", out.txt=""){
  print('## Creating website markdown file: Media')
  
  #### cv entries #####
  suppressMessages(
    cv_entries <- read_csv(in.csv) %>%
      filter(type %in% c('media', 'video')) %>%
      filter(include_in_full_cv == 'y') %>%
      mutate(date_start=paste(date_start_year, date_start_month, date_start_day, sep='-')) %>%
      mutate(date_end=paste(date_end_year, date_end_month, date_end_day, sep='-')) %>%
      mutate(year_begin = date_start_year) %>%
      mutate(year_end = date_end_year) %>%
      mutate(year = ifelse((is.na(year_end) | year_begin == year_end),
                           year_begin,
                           str_c(year_begin, " --- ", year_end))) %>%
      arrange(desc(year))
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
}





######################
####     Code     ####
######################
render_site_code <- function(in.csv="cv_entries.csv", out.file="_pages/code.md", out.txt=""){
  print('## Creating website markdown file: Code')
  
  #### cv entries #####
  suppressMessages(
    cv_entries <- read_csv(in.csv) %>%
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
  out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
  
  count <- nrow(cv_entries)
  for (i in 1:count) {
    out.txt <- paste(out.txt, sep='', "# ", cv_entries[i,]$what, '\n')
    out.txt <- paste(out.txt, sep='', cv_entries[i,]$additional_info, '\n')
    out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
    out.txt <- paste(out.txt, sep='', '<div class="github-card" data-github="', cv_entries[i,]$where, '" data-width="400" data-height="279" data-theme="medium"></div>\n')
    out.txt <- paste(out.txt, sep='', '<script src="//cdn.jsdelivr.net/github-cards/latest/widget.js"></script>\n')
    out.txt <- paste(out.txt, sep='', '<br/><br/>\n')
  }
  
  write(out.txt, out.file)
}





######################
#### Publications ####
######################
render_site_publications <- function(in.csv="publications.csv", out.file="_pages/publications.md", out.txt=""){
  print('## Creating website markdown file: Publications')
  
  #### publications #####
  suppressMessages(
    publications <- read_csv(in.csv) %>%
      filter(include_in_full_cv == 'y')
  )
  
  ## Publications
  p <- publications %>%
    mutate(date=paste(publication_date_year, publication_date_month, publication_date_day, sep='-')) %>%
    mutate(year = publication_date_year) %>%
    arrange(desc(year))
  
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
  out.txt <- paste(out.txt, sep='', '<script type=\'text/javascript\' src=\'https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js\'></script>\n')
  out.txt <- paste(out.txt, sep='', '\n')
  
  pub.count <- nrow(p)
  n <- 0
  for (select_year in sort(unique(p$year), decreasing=T)) {
    tmp <- p %>% filter(year == select_year)
    out.txt <- paste(out.txt, sep='', '## ', select_year, '\n\n')
    for (i in 1:nrow(tmp)) {
      out.txt <- paste(out.txt, sep='', "### ", (pub.count-n), '\\. ', tmp[i,]$title, '\n')
      
      t <- tmp[i,] %>% mutate(ref2print = str_c(authors_full, " *", journal, "*")) %>%
        mutate(ref2print = ifelse(!is.na(ref_info), 
                                  str_c(ref2print, ", ", ref_info, ", ", year(date), "."), 
                                  str_c(ref2print, ", ", year(date), "."))
        )
      out.txt <- paste(out.txt, sep='', t$ref2print, '\n\n')
      
      t <- tmp[i,] %>% mutate(ref2print = '') %>%
        mutate(ref2print = ifelse(!is.na(url), 
                                  str_c(ref2print, "[[URL](", url, ")]  "), 
                                  ref2print)
        ) %>%
        mutate(ref2print = ifelse(!is.na(pdf), 
                                  str_c(ref2print, "[[PDF](", pdf, ")]  "), 
                                  ref2print)
        ) %>%
        mutate(ref2print = ifelse(!is.na(preprint), 
                                  str_c(ref2print, "[[Preprint](", preprint, ")]  "), 
                                  ref2print)
        )
      out.txt <- paste(out.txt, sep='', t$ref2print, '\n')
      
      t <- tmp[i,] %>% mutate(ref2print = '') %>% 
        mutate(ref2print = ifelse(!is.na(additional_info_2), 
                                  str_c(ref2print, additional_info_2), 
                                  ref2print)
        )
      out.txt <- paste(out.txt, sep='', t$ref2print, '\n')
      
      t <- tmp[i,] %>% mutate(ref2print = '') %>%
        mutate(ref2print = ifelse(!is.na(doi), 
                                  str_c(ref2print, '\n<div class=\'altmetric-embed\' data-badge-type=\'donut\' data-doi="', doi, '"></div>'), 
                                  ref2print)
        )
      out.txt <- paste(out.txt, sep='', t$ref2print, '\n')
      
      out.txt <- paste(out.txt, sep='', '<br/><br/><br/><br/>\n')
      
      n<-n+1
    }
  }
  
  write(out.txt, out.file)
}



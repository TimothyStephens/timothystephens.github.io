# Source and main changes

Original source: A Github Pages template for academic websites by [Stuart Geiger](https://github.com/staeiou): [academicpages.github.io](https://github.com/academicpages/academicpages.github.io).  Academicpages was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.  
I subsequently clones this repository from [Eli Holmes](https://github.com/eeholmes/eeholmes.github.io)

I (Timothy) forked (then detached) an edited copy of academicpages from Eli Holmes. I have changed and reduced many of the pages. My major contribution is adding clode to automatically update the pages from master csv files using `R`. This code also generates anew copy of the user CV.

# Instructions for using my hacked version of academicpages as your website

1. Clone [timothystephens.github.io](https://github.com/TimothyStephens/timothystephens.github.io). 
1. Enable GitHub Pages for your repository. Go to the repository's settings (rightmost item in the tabs that start with "Code", should be below "Unwatch"). Rename the repository. If you name it [Your GitHub username].github.io", then that will be your website's URL: `http://username.github.io`. Alternatively, you could name your repository `foo` and your URL would be `http://username.github.io/foo`. 
1. You'll want to specify for GitHub Pages to use master.  Go to your respository settings, and scroll down towards the bottom and you'll see a section on GitHub Pages and the first option is to specify Source.  Choose 'master branch'.
1. Wait a bit for Jekyll to do it's stuff and go to your URL to see the website.
1. Hack away. You will find the pages for publications, talks, etc in the `_pages` folder.


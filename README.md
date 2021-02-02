# UW Glaciology group technical tips and tricks page

This repository stores the data for the website. It also automatically builds the new version of the website for each commit using [Jekyll](https://jekyllrb.com/docs/github-pages/). See the website homepage (https://uwglacier.github.io/) for instructions to contribute.

The important things you might want to edit are:

 * `index.md`: This markdown file contains the content for the website's homepage. Edit this file to update the homepage. You can also compare the raw markdown to the website's homepage to see how to include Latex equations, images, links, and code blocks in Markdown.
 * `_pages/`: This directory contains the Markdown files that create the website pages content. For example, to edit the "Matlab" page, edit `_pages/matlab/matlab.md`.
 * `_data/navigation.yml`: This file controls the links in the "Masthead" (the top right menu). This short configuration file should be self-explanatory.
 * `code/`: This is the directory with the code examples from the wiki.
 
 
Things you can safely ignore:

 * `_sass/`: This directory controls the look and behaviour of the website. Feel free to look around, but remember that `_pages/` controls the content.
 * `_includes/`
 * `assets/`
  

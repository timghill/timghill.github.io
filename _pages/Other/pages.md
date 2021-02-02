---
permalink: /other/pages/
title: "Github Pages"
---

Github Pages is an online documentation hosting service that is tightly integrted into your Github repositories. There are two main usage patterns with Pages: hosting prebuilt static HTML pages, or building HTML pages from another language (usually Markdown) using Jekyll.

# Static HTML pages using Mkdocs
Hosting static HTML pages is easier to get running but requires you to commit HTML pages to your repo. This section describes using [Mkdocs](https://www.mkdocs.org/) to generate static HTML pages, and how to host these on Github pages.

## Using Mkdocs
First, the [Mkdocs documentation](https://www.mkdocs.org/) is excellent! This is a brief overview of getting started.

### Configuration file
To set up Mkdocs in your repo, include a configuration file `mkdocs.yml` in the root directory. See Tim's [finite volume methods](https://github.com/timghill/finite-volume) repo for an example of this workflow. This repo's configuration file is copied below. it configures a website with three pages (specified under `nav`), and uses the `pymdownx` extension to allow math to be typeset nicely.

```yaml
site_name: 'Finite volume methods'
theme:
    name: material
    icon:
      logo: material/vector-square
    palette:
      - sheme: default
        primary: blue grey
        accent: deep purple

# Required to load the MathJax javascript for the mdx_math.py
extra_javascript:
        - 'https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML'
        - 'javascripts/extra.js'
nav:
        - Home: index.md
        - shallow_water.md
        - heat_equation.md
          
markdown_extensions:
        - pymdownx.highlight
        - pymdownx.superfences

docs_dir: docs_source/
site_dir: docs/
```

### Adding your content
This configuration file specifies that the Markdown source files are stored in the `docs_source/` directory, and the HTML pages will be built to the `site_dir`, in this case `docs/`. Now you can add your content to the source directory!

### Building the HTML
Once your Markdown source files are in the `docs_dir`, you can build your HTML pages using:

```bash
mkdocs build
```

It's that easy! Now you should have static HTML pages in your `site_dir`, in this case `docs/`. At this point you can open these pages as local files in your web browser to check the content. You can also run `mkdocs serve` and open `http://127.0.0.1:8000/` in your browser to view your documentation.

## Hosting on Github Pages
Open your Github repository on the web interface and navigate to the repo Settings. Scroll down to "Github Pages". Set the branch and docs directory, and you should be good to go!

Github Pages has good [documentation](https://docs.github.com/en/github/working-with-github-pages) that should answer your questions! Feel free to fork [Tim's repo](https://github.com/timghill/finite-volume/) to get yourself started too.

# Publishing from Markdown with Jekyll
The other primary workflow to use Github Pages is to commit Markdown files to your repo and to have Github automatically build these to HTML using a service called Jekyll. Once agin, the [Github Pages documentation](https://docs.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll) page is very helpful here.

This workflow is a good choice for collaborative documentation since it omits the local build step from the previous workflow using Mkdocs. This means that collaborators can work using solely the web interface, and that nobody has to pull the new changes, build the HTML, then push the HTML.

The downside to Jekyll is that out-of-the-box it is intended for blogging. This does not seem to fit well with the type of documentation we would want to host. Instead, you can use external themes to suit your needs. For exampe, this wiki is built using the [Minmal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme! Have a look around the source code for the wiki, and again feel free to fork the repo to use it as a starting point for your own projects!

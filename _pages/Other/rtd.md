---
permalink: /other/rtd/
title: "Readthedocs"
---

This guide describes hosting documentation on Readthedocs using Mkdocs. You can also use Sphinx, which builds your documentation from ReStructuredText (rst). Since this guide uses Mkdocs there will be some overlap with the Mkdocs guide for Github Pages.

Following along with this [example repository](https://github.com/timghill/readthedocs), which provides this source for the online documentation [http://readthedocs-example.rtfd.io/](http://readthedocs-example.rtfd.io/). Feel free to fork this repo to get started with Mkdocs and RTD.

Similar to using Github Pages with Jekyll, your documentation is automatically rebuilt any time you commit changes to your code repository. This makes it super easy to always have updated online documentation!

## Set up your repo
Create a configuration file `mkdocs.yml` in the root directory of your repository. The configuration file for the example repository is copied below. The only unusual thing about this config file is the `extra_javscript` field. This lets you use Latex syntax to typeset math!

```yaml
site_name: Readthedocs with Mkdocs
docs_dir: 'docs/'
extra_javascript:
  - 'javascripts/extra.js'
  - 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-MML-AM_CHTML'
pages:
    - Home: index.md
    - getting_started.md
    - another_page.md
theme:
    name: readthedocs  
```

This config file specifies that your docs source Markdown files should be in the `docs/` directory. Include the files you've indicated under the `pages` field, and you should be ready to move on to setting up the docs on the Readthedocs site!

## Readthedocs setup
If you don't already have an account on Readthedocs ([https://readthedocs.org/](https://readthedocs.org/)), create one and link it to your Github account.

Create a new project from the repository you created above. Before you can build the docs, there are a few steps you need to do:

 * In the Settings for your docs, navigate to Advanced Settings then Documentation Type. Select "Mkdocs".
 * You also need to set the branch your documentation should build from (usually `main`).

Save these settings, and your documentation should build! If not, force it to build (under `Builds`) tab.

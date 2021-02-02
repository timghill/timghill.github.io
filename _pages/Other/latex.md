---
permalink: /other/latex/
title: "Writing with Latex and Overleaf"
---

What is Latex? From the [Overleaf](https://www.overleaf.com/learn) documentation,

 > LaTeX is a great tool to create documents. It's based on the 'WYSIWYM' (what you see is what you mean) idea, meaning you only have to focus on the contents of your document and the computer will take care of the formatting. With LaTeX, it's very easy to create professional-looking material.

In practice, Latex is similar to Markdown in that it is a tool you use to create and format documents. The difference is that Latex is optimized for creating professional-looking PDF documents.

Latex is not a "What you see is what you get" editor, meaning that with Latex you write a plain text text document which gets compiled to the formatted PDF document. This can be harder at first, but it makes things like placing figures, writing and formatting equations, and cross-referencing within the document much easier than with Word or Google Docs.

## Getting started
You can choose to work with Latex locally, or using a cloud service. Latex source code needs to be compiled, so it's easier to use a Latex environment such as [TexStudio](https://www.texstudio.org/) than it is to compile on command line. The easiest option, however, is to use the free online editor [Overleaf](https://www.overleaf.com/).

There are a few different excellent guides to writing in Latex:

 * [https://www.overleaf.com/learn](https://www.overleaf.com/learn)
 * [https://en.wikibooks.org/wiki/LaTeX](https://en.wikibooks.org/wiki/LaTeX)
 * [https://tex.stackexchange.com/](https://tex.stackexchange.com/) for answers to all your Latex questions!
 
## Journals
Most journals provide a Latex template with excellent instructions. This is where Overleaf really excels. Most journals provide you a link to their template on Overleaf. When you're done, the template usually has a link to submit directly to the journal!
 
  * [JOG](https://www.overleaf.com/latex/templates/latex-template-for-journal-of-glaciology-jog/prcsfgbpbckc#.WXXJdunavVh)
  * [JGR](https://www.overleaf.com/latex/templates/american-geophysical-union-agu-agutex-article/spqmvzkffdrq#.WZWvbneGMUF)
  * [Cryosphere](https://www.overleaf.com/latex/templates/copernicus-publications-latex-package-5-dot-6/xdsrhcrdwndx)

These templates usually give you examples of how they would like you to format figures, tables, equations, captions, etc.

## Theses
The University of Waterloo provides an [Overleaf thesis template](https://www.overleaf.com/latex/templates/university-of-waterloo-thesis-template/rndjnzvhjqfk) that contains helpful instructions throughout.

## Track changes
Latex is great, but it does not come close to Word for the Track Changes functionality. Overleaf lets you track changes to the *source*, but this requires your collaborators to be willing to read your source code. So, the best you can do is compile a track changes PDF document that compares two revisions of the source code. The best package for this is [latexdiffcite](https://pypi.org/project/latexdiffcite/). The command I used is:

```
latexdiffcite file original_submission.tex revised_submission.tex -o diff_latexdiffcite.tex
```

Then, you can upload `diff_latexdiffcite.tex` to Overleaf, compile it, and view and share your track changes PDF!

## Example
The following example source file shows the advantage of Latex for equation numbering and cross-referencing. You can view and compile this example [here](https://www.overleaf.com/6977487229ygqwsqnycmkn).

```
\documentclass{article}

\usepackage[utf8]{inputenc}
\usepackage{amsmath}    % For better math
\usepackage{amssymb}    % For better math
\usepackage{graphicx}   % For including images
\usepackage[margin=1in]{geometry}   % 1 inch margins

\title{Your very awesome title}
\author{Tim Hill and friends}
\date{January 2021}

\begin{document}

\maketitle

\section{Introduction}
Conservation equations may be written in the form

\begin{equation}
\label{eq:consLaw}
\frac{\partial u}{\partial t} + \nabla \cdot \mathbf{q} = f,
\end{equation}
where $\mathbf{q}$ is the flux and $f$ is a source term. For the heat equation, the flux may be written

\begin{equation}
\label{eq:flux}
\mathbf{q} = - \kappa \nabla u,
\end{equation}
which, combined with (\ref{eq:consLaw}), gives the familiar form

\begin{equation}
\label{eq:heat}
\frac{\partial u}{\partial t} = \kappa \nabla^2 u + f.
\end{equation}

While (\ref{eq:heat}) is probably more familiar to you, it is numerically easier to consider the problem to be composed of equations (\ref{eq:consLaw}) and (\ref{eq:flux}).

\end{document}
```

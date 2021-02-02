---
layout: single
author_profile: true
title: "Welcome to the University of Waterloo Glaciology Group Wiki"
---
This website has a wealth of technical tips and tricks that can making your life working with GlaDS (and more!) easier. The goal is that this site will be the central place that we all look for solutions to our specific problems. Along with that, we all need to remember to post about our solutions!

## External resources
Here are some additional resources you might find helpful:

 * cmocean for [Matlab](https://www.mathworks.com/matlabcentral/fileexchange/57773-cmocean-perceptually-uniform-colormaps) and [python](https://matplotlib.org/cmocean/)
 * Tim's [palettes package](https://github.com/timghill/palettes) to use the [SciVis Color](https://sciviscolor.org/) colourmaps

## Contribution instructions
This page is written in Markdown. If you are unfamiliar with it, see [this guide](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). Markdown is a friendly language, and is especially nice for including code snippets and images.

You can contribute from the Github web interface, or by cloning the repository and pushing changes. The web interface lets you preview your changes in rendered Markdown. You can also use a text editor like Atom to preview your Markdown code.

You can typset math using LaTeX syntax using delimiters `$$`:

$$\frac{\partial u}{\partial t} + \nabla \cdot \vec{q} = 0$$

## Images
You can include pictures from a link with this code:

```html
<figure>
	<a href="http://farm9.staticflickr.com/8426/7758832526_cc8f681e48_b.jpg"><img src="http://farm9.staticflickr.com/8426/7758832526_cc8f681e48_c.jpg"></a>
</figure>
```

<figure>
	<a href="http://farm9.staticflickr.com/8426/7758832526_cc8f681e48_b.jpg"><img src="http://farm9.staticflickr.com/8426/7758832526_cc8f681e48_c.jpg"></a>
</figure>

Or you can include local photos with
```markdown
![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/diurnal_hs_hc.png){: .align-center}

```

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/diurnal_hs_hc.png){: .align-center}

## Pages
The content for the website is stored in the `_pages/` directory. Each of the navigation tabs on the website (GlaDS, Matlab, Other) has its own subfolder that stores the Markdown files.

Add a markdown file in the `_pages/` directory with your content to add a new page to the site. If you want to add the file to the top navigation bar, also add the appropriate data to `_data/navigation.yml`. See the pages already there for examples.

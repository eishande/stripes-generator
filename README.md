#### Knit Your Data: Data Visualizer & Knitting Pattern Generator

This Ruby on Rails app allows users to input numerical data and generate a pattern of color-coded stripes which can be used as a knitting pattern (for a scarf, for example).

![Homepage Carousel](https://farm8.staticflickr.com/7685/17263633446_f786c203ae_c.jpg)

![Default Pattern Generator](https://farm9.staticflickr.com/8757/17289586845_ce3746c174_z.jpg)

The default colors were chosen from [ColorBrewer](http://colorbrewer2.com/), whose palettes were originally designed for maps. Using a multi-hued scale that also changes in lightness helps readers ![differentiate between colors more than using a single-hue scale](https://vis4.net/blog/posts/mastering-multi-hued-color-scales/), and thus improves the honesty of the visualization.

![Picking colors](https://farm9.staticflickr.com/8814/16667120324_5129924ae7_z.jpg)

However, users are more likely to be working with pre-defined colors or a pre-defined set of choices -- commercial yarn lines come in a smaller set of colors than the number of web-safe colors. The colors are customizable (using the [jQuery Minicolors plugin/Rails gem](https://github.com/kostia/jquery-minicolors-rails)) and once the original pattern is generated the colors can be tweaked on the same page.

![Viewing/Editing pattern](https://farm8.staticflickr.com/7661/17103380709_7dd114597b_z.jpg)

The pattern is generated using [D3.js](http://d3js.org/) JavaScript code.

CRUD functionality allows the user to input their own data, view/edit/delete datasets, and view/edit/delete patterns (color palettes with a given dataset).

Future plans:
* Allow the user to select a different number of colors (initial implementation requires 5)
* Connect to open-source data sets for one-click pattern generation
* Allow input of data in different formats (more user-friendly)
* Conduct and incorporate feedback from user testing

Credits (in addition to those linked above)
* Inspiration: James Zoll's [Temperature Scarf Generator](https://github.com/Zerack/zoll.me/tree/master/scarf)
* Temperature scarf concept by [Kristen Cooper](http://www.ravelry.com/patterns/library/my-year-in-temperatures--scarf-)

Created by Kate Buckner at [Launch Academy](http://www.launchacademy.co)

[![Build Status](https://travis-ci.org/eishande/stripes-generator.svg?branch=master)](https://travis-ci.org/eishande/stripes-generator)

[![Coverage Status](https://coveralls.io/repos/eishande/stripes-generator/badge.svg)](https://coveralls.io/r/eishande/stripes-generator)

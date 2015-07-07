This repository houses the source for UMass Transit's pubic web site
hosted at http://umass.edu/transit/  Once it gets to OIT's server, it is
an entirely static site, but there are some tools on the developer's end
that build it out of some semi-dynamic parts.

Getting Started
===============
The project has a `.rvmrc` file and a `Gemfile` in it; run `bundle` to
install the gems you need:

* [Stasis][stasis]
* [Redcarpet][redcarpet]
* [Sass][sass]

Now, run stasis to compile the site.

```bash
stasis
```

If you run stasis in "development" mode, it will watch the code
directory for changes and re-compile the site whenever a file changes.
You also get a HTTP server to test the site out with.

```bash
stasis -d 3000
```

Now, if you visit http://localhost:3000/slideshow.html you'll get a
local version of the site.

Stasis
======
The [project page][stasis] has a great overview of features that stasis
has built in -- take a look there first. There are, however, some
site-specific things you should know.

The `public` Directory
----------------------
Stasis puts the compiled site in the `public/` directory.  This
directory is in the `.gitignore` file because everything in there is a
complied asset, and we don't want the source and the compiled site to
diverge.

The controller
--------------
The heart of the build process is governed by `controller.rb` it sets up
some instance variables that are used to tell a page what stylesheets
and javascripts to include, and can modify the layout of pages.  The
comments in there are pretty explanitory.

Layout
------
The main site layout is in `layout.html.erb`.  Every page uses this
layout *except* for the front page (`slideshow.html.erb`).  If you look in
the layout file, you will see a tag that says `<%= yield %>`.
Individual page content ends up there.

The layout also contains the following partials:

*   `_header.html.erb`

    contains the search bar, "transit services" wordmark, and the top
    navigation menus.

*   `_left_column.html.erb`

    contains the left-hand menus.  This will be displayed unless you set
    `@leftmenu = false` in the before block for the page (useful for
    extra-wide content).

*   `_footer.html.erb`

    contains the copyright notice and UMass seal.

*   `_ga.html.erb`

    contains the Google Analytics code

File formats
------------
There are all sorts of supported parsers in Stasis, but we've stuck to
Markdown for simple pages, Erb for more complicated ones, and SCSS for
any pre-processed CSS.

Page titles
-----------
The controller will auto populate the page title using the template
filename by dropping the extension, replacing underscores with spaces,
and capitalizing every word.  So `blah_blah_blah.html.erb` will have a
page title of "Blah Blah Blah".

If you want to sepecify a different page title, put it in
`page_titles.yml`

Deployment
==========
Deployment is done with [Capistrano][cap] with some small modifications
to the default process.

The deployment strategy is `:copy` because our login to OIT's server is
pretty crippled.  There's no git, no ssh agent forwarding, and no sudo.
Luckily, all "copy" needs is sftp access and "tar"/"gzip".

For a similar reason, we need to have a `.htaccess` file at the root of
the deployment location to rewrite requests into the `current/public`
directory.  This file is created by Capistrano after you run the
`deploy:setup` task.

The project doesn't actually have a "real" `index.html` in it.  Instead,
Capistrano sym-links index to another file on deploy.

* If it is a first-time deploy, `index.html` gets linked to
  `slideshow.html`
* If it is a standard deploy, `index.html` gets linked to whatever it
  was already linked to pre-deploy
* A user can switch what `index.html` is linked to with the `cap
  index:slideshow` and `cap index:news` tasks.

[cap]: https://github.com/capistrano/capistrano
[redcarpet]: https://github.com/tanoku/redcarpet
[sass]: http://sass-lang.com/
[stasis]: http://stasis.me/

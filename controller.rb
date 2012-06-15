# Put files in here that are part of the project, but not part of the site.
# They won't be copied into the "public" folder when stasis builds the site.
ignore *%w{.gitignore .rvmrc LICENSE Gemfile Gemfile.lock Rakefile capfile}

ignore(/\.swp$/, %r{/\.git/}, %r{/\.sass-cache/})
ignore /\/_.*/
ignore /layout.*/

layout "layout.html.erb"

# These instance variables are the defaults and are available in every template.
# They are overwritten or added to for specific pages below.
before /.*/ do
  # An array of .css files in the stylesheets/ directory to link in
  @stylesheets = %w{ base }

  # An array of .js files in the javascript/ directory to link in
  @scripts = []

  # Whether or not to show the left-hand navigation menu (_left_column.html.erb)
  @leftmenu = true

  # Whether or not to inclue a <link rel="alternate" ...> tag for the rss feed
  @rss = false

  # The current year (gets used for the copyright notice in the footer)
  @year = Time.now.year
end

before "bike_racks.html.erb" do
  @stylesheets << "bike_racks"
end

before "contactus.html.erb" do
  @stylesheets += %w{tables contactus}
  @scripts << "tables"
end

before "directions.html.erb" do
  @stylesheets << "directions"
end

before "jobapplication_bus.html.erb" do
  @stylesheets << "jobapplication_bus"
  @leftmenu = false
end

before "maps.html.erb" do
  @leftmenu = false
end

before "meet_greet.html.erb" do
  @stylesheets << "meet_greet"
end

before "meet_greet_form.html.erb" do
  @stylesheets += %w{meet_greet meet_greet_form}
  @scripts << "h5f.min"
end

before "news.html.erb" do
  @rss = true
  @stylesheets << "news"
end

before "rates_ft.html.erb" do
  @stylesheets << "rates_ft"
  @leftmenu = false
end

before "related_info.html.erb" do
  @stylesheets << "related"
  @scripts << "tables"
end

before "schedules.html.erb" do
  @stylesheets += %w{schedules tables}
  @scripts << "lists"
end

before "slideshow.html.erb" do
  layout "slideshow.html.erb"
end

before "spectrans.html.erb" do
  @stylesheets += %w{spectrans tables}
  @scripts << "tables"
end

before "staff.html.erb" do
  @stylesheets << "staff"
end

# Load the filename => title hash from yaml.  Also, specify a default title.
# The default title is the filename without the extension, all the underscores
# turned into spaces, and every word capitalized.  If you ask the hash for a
# key that doesn't exists, you'll get that.
require 'yaml'
titles = YAML.load_file( File.join( File.dirname( __FILE__ ), "page_titles.yml" ) )
titles.default_proc = proc do |hash, key|
  hash[key] = key.split('.').first.gsub(/_/, ' ').gsub(/\b('?[a-z])/) { $1.capitalize }
end

# Put files in here that are part of the project, but not part of the site.
# They won't be copied into the "public" folder when stasis builds the site.
ignore *%w{.gitignore .rvmrc capfile LICENSE Gemfile Gemfile.lock Rakefile README.md}

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

  # The page title.  This one can be overwritten, but its better to use page_titles.yml
  path = String.new(@_stasis.path)
  path.slice!(File.dirname(__FILE__) + '/')
  @title = titles[path]
end

# These pages each have their own stylesheet of the same name
%w{bike_racks contactus directions jobapplication_bus meet_greet meet_greet_form
   news rates_ft related_info spectrans staff}.each do |page|
  before "#{page}.html.erb" do
    @stylesheets << page
  end
end
%w{schedules}.each do |page|
  before "#{page}.html.md" do
    @stylesheets << page
  end
end

# These pages have no left-hand navigation column
%w{jobapplication_bus maps rates_ft}.each do |page|
  before "#{page}.html.erb" do
    @leftmenu = false
  end
end

# These pages have tables
%w{contact_us related_info spectrans}.each do |page|
  before "#{page}.html.erb" do
    @stylesheets << "tables"
    @scripts << "tables"
  end
end

before "meet_greet_form.html.erb" do
  @stylesheets << "meet_greet"
  @scripts << "h5f.min"
end

before "news.html.erb" do
  @rss = true
end

# Setting layout to itself is stasis's way of saying "no layout"
before "slideshow.html.erb" do
  layout "slideshow.html.erb"
end

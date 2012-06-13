ignore *%w{.gitignore LICENSE Gemfile Gemfile.lock Rakefile}
ignore(/\.swp$/, %r{/\.git/}, %r{/\.sass-cache/})
ignore /\/_.*/

layout "layout.html.erb"

before /.*/ do
  @stylesheets = %w{ base }
  @scripts = %w{ prototype }
  @date = Time.now.year
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
  layout "layout_no_menu.html.erb"
end

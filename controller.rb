ignore *%w{.gitignore LICENSE Gemfile Gemfile.lock Rakefile}
ignore(/\.swp$/, %r{/\.git/}, %r{/\.sass-cache/})
ignore /\/_.*/

layout "layout.html.erb"

before /.*/ do
  @stylesheets = %w{ base }
  @date = Time.now.year
end

before "bike_racks.html.erb" do
  @stylesheets << "bike_racks"
end

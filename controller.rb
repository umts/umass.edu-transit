ignore /\/_.*/

layout "layout.html.erb"

before /.*/ do
  @stylesheets = %w{ base }
  @date = Time.now.year
end

before "bike_racks.html.erb" do
  @stylesheets << "bike_racks"
end

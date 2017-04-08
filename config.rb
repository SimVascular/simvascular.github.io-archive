###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true
#set :markdown_engine, :kramdown

page "/", :layout => "frontpage"
page "/docs*.html", :layout => "docs"
page "/clinical*.html", :layout => "clinical"
page "/comingSoon*.html", :layout => "comingSoon"

###
# Code highlighting
###

activate :syntax


# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# DOCS
["Installation", "QuickGuide", "ModelGuide", "Meshing", "FlowSolver", "Compile", "CodeSnippets", "Refs"].each do |name|
  proxy "/docs#{name}.html", "/docsTemplate.html", :locals => { :man_name => name }, :ignore => true
end

# CLINICAL TEST CASES
["Case1", "Case2", "Case3", "Case4"].each do |name|
  proxy "/clinical#{name}.html", "/clinicalTemplate.html", :locals => { :clinical_name => name }, :ignore => true
end

# ARCHIVES
["InstallationSV2", "QuickGuideSV2", "ImageGuideSV2", "ModelGuideSV2", "MeshingSV2", "FlowSolverSV2", "CodeSnippetsSV2"].each do |name|
  proxy "/archive#{name}.html", "/archiveTemplate.html", :locals => { :man_name => name }, :ignore => true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Make sure that the lib/ folder is in the load path
$:.unshift(Halcyon.root/'lib')

# Silence Thin's logging
Thin::Logging.silent = true if defined? Thin

# Configure Halcyon's paths


# use PathPrefix Middleware if :path_prefix is set in Merb::Config
if prefix = ::Merb::Config[:path_prefix]
  use Merb::Rack::PathPrefix, prefix
end

# comment this out if you are running merb behind a load balancer
# that serves static files
use Merb::Rack::Static, Merb.dir_for(:public)

# Set up array of apps for cascading requests.
apps = []

# Add the apps
apps << Halcyon::Runner.new
apps << Merb::Rack::Application.new

# Begin cascading
run Rack::Cascade.new(apps)

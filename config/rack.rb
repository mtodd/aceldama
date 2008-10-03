# Silence Thin's logging
Thin::Logging.silent = true if defined? Thin

# use PathPrefix Middleware if :path_prefix is set in Merb::Config
if prefix = ::Merb::Config[:path_prefix]
  use Merb::Rack::PathPrefix, prefix
end

# comment this out if you are running merb behind a load balancer
# that serves static files
use Merb::Rack::Static, Merb.dir_for(:public)

# Run the Merb::Rack application
run Merb::Rack::Application.new

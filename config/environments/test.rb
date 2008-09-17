Merb.logger.info("Loaded TEST Environment...")
Merb::Config.use { |c|
  c[:testing] = true
  c[:exception_details] = true
  c[:log_auto_flush ] = true
}

Halcyon.config.use do |c|
  c[:environment] = :test
  
  c[:logging] = {
    :type => 'Logger',
    # :file => nil, # nil is STDOUT
    :level => 'error'
  }
end

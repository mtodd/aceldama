Merb.logger.info("Loaded RAKE Environment...")
Merb::Config.use { |c|
  c[:exception_details] = true
  c[:reload_classes]  = false
  c[:log_auto_flush ] = true
  c[:log_file] = Merb.log_path / 'merb_rake.log'
}

Halcyon.config.use do |c|
  c[:environment] = :test
  
  c[:logging] = {
    :type => 'Logger',
    # :file => nil, # nil is STDOUT
    :level => 'error'
  }
end

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir     = 'features/cassettes'
  c.default_cassette_options = {
    match_requests_on: %i(method host path)
  }
  c.debug_logger = File.open(File.expand_path('./log/vcr_debug.log',Rails.root), 'w')
end

Around do |scenario, block|
  VCR.use_cassette('default') do
    block.call
  end
end

#!/usr/bin/ruby
require 'facter'
Facter.add('instance_id') do
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id')
  end
end

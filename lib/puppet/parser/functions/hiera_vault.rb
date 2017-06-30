require 'hiera_puppet'
require 'hiera_vault'

module Puppet::Parser::Functions
  newfunction(:hiera_vault, :type => :rvalue, :arity => -2, :doc => "Performs a
  hiera lookup only in the 'vault' backend.
  ") do |*args|
    key, default, override = HieraPuppet.parse_args(args)
    override['is_vault'] = true
    HieraPuppet.lookup(key, default, self, override, :priority)
  end
end
include_recipe 'ohai'
Chef::Log.debug("### foo: #{node['foo']}")
Chef::Log.debug("### bar: #{node['bar']}")

path = '/tmp/chef-test'
cookbook_path ["#{path}/chef"]
file_cache_path path # setting this to the same path as solo.rb causes issues
file_backup_path "#{path}/backup"
checksums_path "#{path}/checksums"
sandbox_path "#{path}/backup"
cache_options :path => "#{path}/cache"

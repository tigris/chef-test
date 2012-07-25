This is a simple repo to demonstrate a small bug with chef-solo with
file_cache_path is set to the same folder that solo.rb exists in, and you run
chef-solo with relative file path.

    $ cd /tmp
    $ git clone git@github.com:tigris/chef-test
    $ sudo chef-solo -c solo.rb -j node.json # works on this run
    $ sudo chef-solo -c solo.rb -j node.json # dies on this run
    $ sudo chef-solo -c /tmp/chef-test/solo.rb -j node.json # works again
    $ sudo chef-solo -c solo.rb -j node.json # dies still

The output from the first success run is here:

    [2012-07-26T01:50:38+10:00] INFO: *** Chef 10.12.0 ***
    [2012-07-26T01:50:39+10:00] INFO: Setting the run_list to "recipe[main]" from JSON
    [2012-07-26T01:50:39+10:00] INFO: Run List is [recipe[main]]
    [2012-07-26T01:50:39+10:00] INFO: Run List expands to [main]
    [2012-07-26T01:50:39+10:00] INFO: Starting Chef Run for vagrant-ubuntu-64.vagrantup.com
    [2012-07-26T01:50:39+10:00] INFO: Running start handlers
    [2012-07-26T01:50:39+10:00] INFO: Start handlers complete.
    [2012-07-26T01:50:39+10:00] INFO: ohai plugins will be at: /tmp/chef-test/ohai_plugins
    [2012-07-26T01:50:39+10:00] INFO: Processing remote_directory[/tmp/chef-test/ohai_plugins] action create (ohai::default line 23)
    [2012-07-26T01:50:39+10:00] INFO: remote_directory[/tmp/chef-test/ohai_plugins] created directory /tmp/chef-test/ohai_plugins
    [2012-07-26T01:50:39+10:00] INFO: Processing cookbook_file[/tmp/chef-test/ohai_plugins/README] action create (dynamically defined)
    [2012-07-26T01:50:39+10:00] INFO: cookbook_file[/tmp/chef-test/ohai_plugins/README] mode changed to 644
    [2012-07-26T01:50:39+10:00] INFO: cookbook_file[/tmp/chef-test/ohai_plugins/README] created file /tmp/chef-test/ohai_plugins/README
    [2012-07-26T01:50:39+10:00] INFO: Processing ohai[custom_plugins] action reload (ohai::default line 39)
    [2012-07-26T01:50:39+10:00] INFO: ohai[custom_plugins] reloaded
    [2012-07-26T01:50:39+10:00] INFO: Processing remote_directory[/tmp/chef-test/ohai_plugins] action nothing (ohai::default line 23)
    [2012-07-26T01:50:39+10:00] INFO: Processing ohai[custom_plugins] action nothing (ohai::default line 39)
    [2012-07-26T01:50:39+10:00] INFO: Chef Run complete in 0.234915 seconds
    [2012-07-26T01:50:39+10:00] INFO: Running report handlers
    [2012-07-26T01:50:39+10:00] INFO: Report handlers complete

And here is the output from the failed runs straight after that:

    [2012-07-26T01:50:41+10:00] INFO: *** Chef 10.12.0 ***
    [2012-07-26T01:50:41+10:00] INFO: Setting the run_list to "recipe[main]" from JSON
    [2012-07-26T01:50:41+10:00] INFO: Run List is [recipe[main]]
    [2012-07-26T01:50:41+10:00] INFO: Run List expands to [main]
    [2012-07-26T01:50:41+10:00] INFO: Starting Chef Run for vagrant-ubuntu-64.vagrantup.com
    [2012-07-26T01:50:41+10:00] INFO: Running start handlers
    [2012-07-26T01:50:41+10:00] INFO: Start handlers complete.
    [2012-07-26T01:50:41+10:00] INFO: ohai plugins will be at: /tmp/chef-test/ohai_plugins
    [2012-07-26T01:50:41+10:00] INFO: Processing remote_directory[/tmp/chef-test/ohai_plugins] action create (ohai::default line 23)
    [2012-07-26T01:50:41+10:00] INFO: Processing cookbook_file[/tmp/chef-test/ohai_plugins/README] action create (dynamically defined)
    [2012-07-26T01:50:41+10:00] ERROR: Running exception handlers
    [2012-07-26T01:50:41+10:00] ERROR: Exception handlers complete
    [2012-07-26T01:50:41+10:00] FATAL: Stacktrace dumped to /tmp/chef-test/chef-stacktrace.out
    [2012-07-26T01:50:41+10:00] FATAL: Errno::ENOENT: No such file or directory - solo.rb

#$buildin_dirs = [ "/home/vagrant/code" ]

#file { $buildin_dirs:
#    ensure => "directory",
#    recurse => true,
#    owner => "vagrant"
#}

#file { '/etc/motd':
#    content => "Welcome to your Vagrant-built virtual machine!Managed by Puppet.\n"
#}

package {'vim':
    ensure => installed
}
node default{

package {'nginx':
    ensure => installed,
}

file {'/tmp/status.txt':
    content => 'Nginx installed',
    mode => '0644',
}

}
node default{

package {'nginx':
    ensure => installed,
}

$packages = ['apache2', 'mysql-server']
package {$packages:
    ensure => installed,
}

$text = "Nginx installed"

file {'/tmp/nginx_status.txt':
    content => $text,
    mode => '0644',
}

exec {"Checking apache":
    command => "/bin/echo apache2 is installed > /tmp/status_apache.txt",
    onlyif => "/bin/which apache2",
}

exec {"Checking shell":
    command => "/bin/echo shell is not installed > /tmp/status_shell.txt",
    unless => "/bin/which sh",
}

}
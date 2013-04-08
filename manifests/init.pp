class noeqd {
  include noeqd::config

  file { [$noeqd::config::datadir, $noeqd::config::logdir]:
    ensure => directory
  }

  file { $noeqd::config::executable:
    content => 'noeqd/bin/noeqd',
    notify  => Service['dev.noeqd'],
    mode    => 0644
  }

  file { '/Library/LaunchDaemons/dev.noeqd.plist':
    content => template('noeqd/dev.noeqd.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.noeqd'],
    owner   => 'root'
  }

  service { 'dev.noeqd':
    ensure  => running
  }

  file { "${boxen::config::envdir}/noeqd.sh":
    content => template('noeqd/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}

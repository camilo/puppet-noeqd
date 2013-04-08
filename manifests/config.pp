class noeqd::config {
  require boxen::config

  $datadir    = "${boxen::config::datadir}/noeqd"
  $executable = "${boxen::config::bindir}/noeqd"
  $logdir     = "${boxen::config::logdir}/noeqd"
  $logfile    = "${logdir}/console.log"
  $port       = 14444
}

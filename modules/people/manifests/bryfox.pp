class people::bryfox {
  $HOME = "/Users/${::boxen_user}"

  notice('Installing custom user modules')

  include java
  include wget
  include iterm2::dev
  include atom
  include chrome
  include firefox
  include gitx::dev

  include heroku
  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }

  # Set system global version defaults
  # TODO: Config should be set in hiera
  class { 'nodejs::global': version => 'v0.10' }
  class { 'ruby::global': version => '2.1.2' }

  # Symlink to boxen script from Applications dir for
  # those who like to double-click on things
  file {
    '/Applications/boxen':
      ensure => 'link',
      target => '/opt/boxen/repo/script/boxen'
  }


}
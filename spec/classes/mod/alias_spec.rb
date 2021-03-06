require 'spec_helper'

describe 'apache::mod::alias', :type => :class do
  let :pre_condition do
    'include apache'
  end
  context "on a Debian OS", :compile do
    let :facts do
      {
        :id                     => 'root',
        :kernel                 => 'Linux',
        :lsbdistcodename        => 'squeeze',
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '6',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :concat_basedir         => '/dne',
      }
    end
    it { is_expected.to contain_apache__mod("alias") }
    it { is_expected.to contain_file("alias.conf").with(:content => /Alias \/icons\/ "\/usr\/share\/apache2\/icons\/"/) }
  end
  context "on a RedHat 6-based OS", :compile do
    let :facts do
      {
        :id                     => 'root',
        :kernel                 => 'Linux',
        :osfamily               => 'RedHat',
        :operatingsystem        => 'RedHat',
        :operatingsystemrelease => '6',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :concat_basedir         => '/dne',
      }
    end
    it { is_expected.to contain_apache__mod("alias") }
    it { is_expected.to contain_file("alias.conf").with(:content => /Alias \/icons\/ "\/var\/www\/icons\/"/) }
  end
  context "on a RedHat 7-based OS", :compile do
    let :facts do
      {
        :id                     => 'root',
        :kernel                 => 'Linux',
        :osfamily               => 'RedHat',
        :operatingsystem        => 'RedHat',
        :operatingsystemrelease => '7',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :concat_basedir         => '/dne',
      }
    end
    it { is_expected.to contain_apache__mod("alias") }
    it { is_expected.to contain_file("alias.conf").with(:content => /Alias \/icons\/ "\/usr\/share\/httpd\/icons\/"/) }
  end
  context "on a FreeBSD OS", :compile do
    let :facts do
      {
        :id                     => 'root',
        :kernel                 => 'FreeBSD',
        :osfamily               => 'FreeBSD',
        :operatingsystem        => 'FreeBSD',
        :operatingsystemrelease => '9',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :concat_basedir         => '/dne',
      }
    end
    it { is_expected.to contain_apache__mod("alias") }
    it { is_expected.to contain_file("alias.conf").with(:content => /Alias \/icons\/ "\/usr\/local\/www\/apache22\/icons\/"/) }
  end
end

class Gndiff < Formula
  desc 'Compares two files with scientific names, no internet connection required.'
  homepage 'https://github.com/gnames/gndiff'
  url 'https://github.com/gnames/gndiff/archive/v0.1.1.tar.gz'
  sha256 '0b4cb2906efd8f7def763048b68a0f206ac35ee237030d716e1f566408d2ef34'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, './gndiff'
  end
end

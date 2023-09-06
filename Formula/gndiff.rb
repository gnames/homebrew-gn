class Gndiff < Formula
  desc 'Compares two files with scientific names, no internet connection required.'
  homepage 'https://github.com/gnames/gndiff'
  url 'https://github.com/gnames/gndiff/archive/v0.2.1.tar.gz'
  sha256 'c8b22048424584a633a4ebb1416ba4086b925b83eef994a92ac583d34bebb196'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, '.'
  end
end

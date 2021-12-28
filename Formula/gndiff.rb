class Gndiff < Formula
  desc 'Compares two files with scientific names, no internet connection required.'
  homepage 'https://github.com/gnames/gndiff'
  url 'https://github.com/gnames/gndiff/archive/v0.1.1.tar.gz'
  sha256 '7db8ec1a41a9b493abd71f3a2cef231c86739c98391bf4f8461864b6ef40ebc9'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, './gndiff'
  end
end

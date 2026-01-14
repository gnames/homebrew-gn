class Gnparser < Formula
  desc 'Breaks biodiversity scientific names into their elements'
  homepage 'https://github.com/gnames/gnparser'
  url 'https://github.com/gnames/gnparser/archive/v1.14.1.tar.gz'
  sha256 'e225da522049b27b4dc7d50f8d9b4c62554e2c3c88d52f0b6842b2d31f224cbd'
  license 'MIT'

  depends_on 'go' => :build

  def install
    man1.install 'man/gnparser.1'
    system 'go', 'build', '-o', *std_go_args, './gnparser'
  end

  test do
    res = `#{bin}/gnparser -f compact "Bubo bubo L."`
    assert_match(/"simple":"Bubo bubo"/, res)
  end
end

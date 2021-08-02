class Gnparser < Formula
  desc 'Breaks biodiversity scientific names into their elements'
  homepage 'https://github.com/gnames/gnparser'
  url 'https://github.com/gnames/gnparser/archive/v1.3.2.tar.gz'
  sha256 '63ea63b963c4f6f557505ed952903e8466f909d3141c9e00dd67a7bd2dfe72d3'
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

class Gnparser < Formula
  desc 'Breaks biodiversity scientific names into their elements'
  homepage 'https://github.com/gnames/gnparser'
  url 'https://github.com/gnames/gnparser/archive/v1.7.1.tar.gz'
  sha256 '9db6986ff387039caac663f9cbd8a1ba4e6512058e29c7f051632d56a45b4296'
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

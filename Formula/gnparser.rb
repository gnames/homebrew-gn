class Gnparser < Formula
  desc 'Breaks biodiversity scientific names into their elements'
  homepage 'https://github.com/gnames/gnparser'
  url 'https://github.com/gnames/gnparser/archive/v1.6.7.tar.gz'
  sha256 '4de55183d89f1313fdffd4e8e8cfe6beba1edd6d65a4a3cdba9362590b9a048f'
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

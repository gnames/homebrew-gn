class Gnparser < Formula
  desc 'Breaks biodiversity scientific names into their elements'
  homepage 'https://github.com/gnames/gnparser'
  url 'https://github.com/gnames/gnparser/archive/v1.5.2.tar.gz'
  sha256 'ad3fdd6469a32a0f80e38d5edc075aecf7c105472cd2eb9c6bdbd23f26948b21'
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

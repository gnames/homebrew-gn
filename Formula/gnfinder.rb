class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v0.16.0.tar.gz'
  sha256 '0b202d8eb8cd25bf30377fa9c1553d544eac8fbf734203c598e88c0ce0a47d62'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, './gnfinder'
  end

  test do
    res = `echo "Bubo bubo" | #{bin}/gnfinder -f compact"`
    assert_match(/"name":"Bubo bubo"/, res)
  end
end

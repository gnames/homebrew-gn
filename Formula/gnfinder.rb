class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v1.1.2.tar.gz'
  sha256 '27d67c45d7f8b4a4efab2344d511a402f25017ca29825184859bbc6213533263'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, '.'
  end

  test do
    res = `echo "Bubo bubo" | #{bin}/gnfinder -f compact"`
    assert_match(/"name":"Bubo bubo"/, res)
  end
end

class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v0.14.0.tar.gz'
  sha256 'd803df9dafd7dbe636db149c79f124256bd828419c1e6e6402f536055c017ef1'
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

class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v1.1.0.tar.gz'
  sha256 '42f917f6bb1034128ba2cdf4cdc5e32e82e7651e3d689bccf1858fec74cb1cb6'
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

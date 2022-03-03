class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v0.18.2.tar.gz'
  sha256 '7b9ea3164718c6453614230983e66eb6a0ded5a0388f04c4f0cf012ef9908dea'
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

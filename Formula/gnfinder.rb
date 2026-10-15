class Gnfinder < Formula
  desc 'Finds scientific names in texts, PDF files, MS Word documents etc.'
  homepage 'https://github.com/gnames/gnfinder'
  url 'https://github.com/gnames/gnfinder/archive/v1.3.0.tar.gz'
  sha256 'c4fbb53577774bce7441e22295c5ee10cb86e97dffb5df2000ac2bc642a3f079'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, '.'
  end

  test do
    res = `echo "Bubo bubo" | #{bin}/gnfinder -f compact`
    assert_match(/"name":"Bubo bubo"/, res)
  end
end

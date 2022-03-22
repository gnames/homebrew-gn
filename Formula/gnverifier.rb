class Gnverifier < Formula
  desc 'Verifies scientific names via exact and fuzzy matching'
  homepage 'https://github.com/gnames/gnverifier'
  url 'https://github.com/gnames/gnverifier/archive/v0.9.1.tar.gz'
  sha256 '27b9ea3164718c6453614230983e66eb6a0ded5a0388f04c4f0cf012ef9908dea'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, './gnverifier'
  end

  test do
    res = `#{bin}/gnverifier "Bubo bubo L."`
    assert_match(/BestMatch,Exact,0,Bubo bubo L./, res)
  end
end

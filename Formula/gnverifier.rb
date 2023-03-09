class Gnverifier < Formula
  desc 'Verifies scientific names via exact and fuzzy matching'
  homepage 'https://github.com/gnames/gnverifier'
  url 'https://github.com/gnames/gnverifier/archive/v1.0.2.tar.gz'
  sha256 '2797c700e2ab2c9044401630960b43a8da9a65dfae01c8cc22fffae1ad867e0a'
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

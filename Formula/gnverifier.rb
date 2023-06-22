class Gnverifier < Formula
  desc 'Verifies scientific names via exact and fuzzy matching'
  homepage 'https://github.com/gnames/gnverifier'
  url 'https://github.com/gnames/gnverifier/archive/v1.1.1.tar.gz'
  sha256 '1fe3a63792245a2021fafa8d6b574bcbc8e281984082e0fec2e46db44f025e0d'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, '.'
  end

  test do
    res = `#{bin}/gnverifier "Bubo bubo L."`
    assert_match(/BestMatch,Exact,0,Bubo bubo L./, res)
  end
end

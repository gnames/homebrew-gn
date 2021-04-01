class Gnverifier < Formula
  desc 'Verifies scientific names via exact and fuzzy matching'
  homepage 'https://github.com/gnames/gnverifier'
  url 'https://github.com/gnames/gnverifier/archive/v0.2.4.tar.gz'
  sha256 'e30ca350395f2af0938b7e37178ff293fc3cd52ea1db4e49b09d79cda1f1450d'
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

class Gnverifier < Formula
  desc 'Verifies scientific names via exact and fuzzy matching'
  homepage 'https://github.com/gnames/gnverifier'
  url 'https://github.com/gnames/gnverifier/archive/v1.2.9.tar.gz'
  sha256 'eecfee967926df36b4040a1b5b478d58ccce294c64c398c7ab9c8a9a6222e192'
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

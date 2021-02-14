class Gnparser < Formula
  desc "Breaks biodiversity scientific names into their elements"
  homepage "https://github.com/gnames/gnparser"
  url "https://github.com/gnames/gnparser/archive/v1.0.7.tar.gz"
  sha256 "43f1e3fb731b25e37a0c287c3914c088667f620bdcbf0e2e5c1af4971bd1325b"
  license "MIT"

  depends_on "go" => :build

  def install
    man1.install "man/gnparser.1"
    system "go", "build", "-o", *std_go_args, "./gnparser"
  end

  test do
    res = `#{bin}/gnparser -f compact "Bubo bubo L."`
    assert_match /"simple":"Bubo bubo"/, res
  end
end

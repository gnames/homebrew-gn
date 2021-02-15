class Gnparser < Formula
  desc "Breaks biodiversity scientific names into their elements"
  homepage "https://github.com/gnames/gnparser"
  url "https://github.com/gnames/gnparser/archive/v1.0.8.tar.gz"
  sha256 "58f529a46604992a0e9af9f81b19269d0493113fa136acfe77411afe93e8322d"
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

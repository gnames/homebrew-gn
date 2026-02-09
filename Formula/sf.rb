class Sf < Formula
  desc 'A universal convertor between a variety of biodiversity formats'
  homepage 'https://github.com/sfborg/sf'
  url 'https://github.com/sfborg/sf/archive/v0.2.8.tar.gz'
  sha256 '7937f9c62a3054377222444dd917385a59db69aa1b150e8ca190dc086028c108'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', *std_go_args, '.'
  end

  test do
    res = `#{bin}/sf -V`
    assert_match(/v0\.2\.8/, res)
  end
end

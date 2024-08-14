class Gfmfmt < Formula
  desc "Format GitHub flavour markdown"
  homepage "https://github.com/PurpleBooth/gfmfmt"
  url "https://github.com/PurpleBooth/gfmfmt/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6b8b75b13218ff4b43323d90f4c6d904cf11b086d1cb4b3d011cab0e138e2487"
  depends_on "bash"
  depends_on "pandoc"

  def install
    bin.install "gfmfmt"
  end

  test do
    (testpath/"Test.md").write <<~EOS
      Hello World
      ===========
    EOS

    system bin/"gfmfmt", testpath/"Test.md"

    assert_equal "# Hello World\n", (testpath/"Test.md").read
  end
end

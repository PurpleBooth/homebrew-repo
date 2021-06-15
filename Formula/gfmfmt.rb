class Gfmfmt < Formula
  desc "Format GitHub flavour markdown"
  homepage "https://github.com/PurpleBooth/gfmfmt"
  url "https://github.com/PurpleBooth/gfmfmt/archive/v0.1.2.tar.gz"
  sha256 "73bec4420f82d64547532281c3aa72b0ee8d2ede824c61a08624c7b1979e299c"
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

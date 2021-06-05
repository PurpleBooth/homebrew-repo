class Specdown < Formula
  desc "Use your markdown documentation as tests"
  homepage "https://github.com/specdown/specdown"
  url "https://github.com/specdown/specdown/archive/refs/tags/v0.43.0.tar.gz"
  sha256 "8993108d74640dc0cb2418832ec0f9f677d652bfb9d19959fb97499ad1cfb5a3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/specdown-0.43.0"
    sha256 cellar: :any_skip_relocation, catalina:     "fbbc4eaceeadf79f05a8d7ffe9c9b73892f0830ac376b3f62e610d79d3d51263"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6cb3b41a8a23a5b3da26f0553205ab2add08b35ffaad393fa6d6e8065a7d5399"
  end

  depends_on "rust" => :build

  resource("testdata") do
    url "https://raw.githubusercontent.com/specdown/specdown/v0.43.0/README.md"
    sha256 "7dc97094496b1ca8e233bc7e8bb055c705698a0bf0f8d5074c76f361af796bd9"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/specdown", "-h"
    system "#{bin}/specdown", "-V"

    resource("testdata").stage do
      assert_match "5 functions run (5 succeeded / 0 failed)", shell_output("#{bin}/specdown run README.md")
    end
  end
end

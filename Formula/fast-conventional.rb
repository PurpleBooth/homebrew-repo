class FastConventional < Formula
  desc "Fill in conventional commit messages quickly"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.0.tar.gz"
  sha256 "a54a3a16b457c7caaa05d7790cadb20f854433d6799b802bb55de04e499978f9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "e2ac16233106a2392ac414b5d08c2ac5f544dd22cd6ecaa926fc31603f33bd53"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fa2e083f4876ccf634e1ac41dcb8c69943799ceb8c2415b3d51d768efb54624"
  end

  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end

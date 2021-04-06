class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.18.tar.gz"
  sha256 "249550a79605cc4fd0a4c76c17fcff9b69898a758ff055f62af5f9fc86770620"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.18"
    sha256 cellar: :any_skip_relocation, catalina:     "5502f4ef44c66e7bae8aa44f164067b58bb06a94d95bafebbe2f770eb04c5d0d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "22125547d3db44708e04f3c3eca3953f2d6f982b0a5faa3924c3c3c23bafc38a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end

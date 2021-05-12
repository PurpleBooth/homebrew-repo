class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.21.tar.gz"
  sha256 "f78a0c99d3a35c534bf062b321b74264e96c32c3a7973ce914bd19919bb41dda"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.21"
    sha256 cellar: :any_skip_relocation, catalina:     "91bf3ebd583e684b98687a14b0901c645214ee8e6be741cd41b4237029ee0670"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2da856856c698f14ce1791e1e41cb0bc27af23e0c1f12987e8030ee5bf811527"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end

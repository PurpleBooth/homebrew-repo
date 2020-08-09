class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.3.tar.gz"
  sha256 "8eb104537a3932e8520d0e31794e18ea1fdee75df1de9e184db2f4613dce391e"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "5c2f58312dd9b979e011aead43c96c0bedd0c0e8e7a1b0bb8fc82c8f99db6581" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end

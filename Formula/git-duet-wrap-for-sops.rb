class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.16.tar.gz"
  sha256 "2bc23ae61fefdd5b9c4a56342e7a2ff890bc4ade4fc8584fd88bfc21cbb4eff0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.16"
    sha256 cellar: :any_skip_relocation, catalina:     "ebbf0dfe2ed97ca3608853f3b2f5ba3a228a9caeff36a32de05ef28d9c875675"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5cd4d6e2a8fd875f0976b24974cce2c778c4f20de05b26f9c530459d486e786f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end

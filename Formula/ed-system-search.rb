class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "9de79f2566dbc198e8464d56c7755bfe4f62bd8ea1e372f8d9b5578d50b24022"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.0"
    sha256 cellar: :any_skip_relocation, catalina:     "860db0bcc53bf8a8f8e2fd7edc0da83c7b6ad6a9848cf9aaf479f5a20ff866a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eaeb6314cb378415277f6013e24d011ac1a80c51c702d6b8b225afe27b1214df"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end

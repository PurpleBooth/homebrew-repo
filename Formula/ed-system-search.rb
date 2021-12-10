class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.10.tar.gz"
  sha256 "fc598550a3ff79ad24e465227c674ded26428b50c8d41ab727254d0940c88ae0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.10"
    sha256 cellar: :any_skip_relocation, catalina:     "24b95240610a3b0e5da296be7010e2e2ac5618f70734a5060538011733851e9c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "002b1a5f502fba84bb15431484aa39001ab69a8ce9e1673379da27dcb21ba725"
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

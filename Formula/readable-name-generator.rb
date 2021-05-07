class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.5.tar.gz"
  sha256 "9b20d2e51bc7060a6ecec775e3fac0da3774648f1b5c1b40b390574cbe5adddd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.5"
    sha256 cellar: :any_skip_relocation, catalina:     "8cfff858d358810150f09f51699430d1f020cdb6b337bac6cbe2722fdedcc7b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6876b54ef39554fe8696d874103a733330c65c18fad923a93b8d0854f0c3f2bb"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/readable-name-generator"
    refute_equal "", shell_output("#{bin}/readable-name-generator").strip
  end
end

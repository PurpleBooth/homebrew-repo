class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.4.tar.gz"
  sha256 "b74da3dcbbcf47eaba058fe54fa10299b9edb2edfd761b56ee64e4f8f77eeb06"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.4"
    sha256 cellar: :any_skip_relocation, catalina:     "5635f496505d28bcf0cf3f8022d61170068bfeaffdf98492a0525a5bbd8b3b86"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4c6608a1c5b52c229721c171e122adf904929dd5623479a6798663d5e6175da"
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

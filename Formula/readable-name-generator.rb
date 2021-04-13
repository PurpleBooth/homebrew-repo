class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.4.tar.gz"
  sha256 "b74da3dcbbcf47eaba058fe54fa10299b9edb2edfd761b56ee64e4f8f77eeb06"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/readable-name-generator"
    refute_equal "", shell_output("#{bin}/readable-name-generator").strip
  end
end

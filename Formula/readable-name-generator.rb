class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.28.tar.gz"
  sha256 "15e5edcaeee32550e3be6f8dd26e96ee33e3228b860bd9638e3a3b673a9158da"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "03fa26ebc828546a8e18bdbd320845cd3051b057c44e6cf5d2ee74dc41d7e75f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "310bfd7a6f613ecd8172c2bf9600c999034e6a372e1de8d0426479a503da3eeb"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "bash")
    (bash_completion/"readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "zsh")
    (zsh_completion/"_readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "fish")
    (fish_completion/"readable-name-generator.fish").write output

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/readable-name-generator")
    (man1/"readable-name-generator.1").write output
  end

  test do
    system "#{bin}/readable-name-generator", "-h"
    system "#{bin}/readable-name-generator", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end

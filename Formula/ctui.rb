class Ctui < Formula
  desc "Minimal terminal calendar and task list (TUI and CLI)"
  homepage "https://github.com/andples/ctui"
  version "0.2.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/ctui; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.1/ctui-aarch64-apple-darwin.tar.gz"
      sha256 "af8de49551cdc9673f904e316ac92a1f0f2d59784ee0d79b4bbc5c04b8965470"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.1/ctui-x86_64-apple-darwin.tar.gz"
      sha256 "6f39898a41da5a280659e3182cc07f1c29377184e1bfe1b322fd13ea4f3bc0c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.1/ctui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d8af443eaf573a9276e853c7e212e08ad3773fba5fe492679c4332a1cc91acbd"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.1/ctui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f7a6c0387d7adb297a6aab72fe03c8fa71b6d8187dfa0deb1ea67166eb5167fd"
    end
  end

  head do
    url "https://github.com/andples/ctui.git", branch: "master"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "ctui"
    end
    # The Monkeytype themes (GPL-3.0, separate files); ctui finds them in
    # share/ctui/themes next to its own prefix.
    pkgshare.install "themes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctui --version")
  end
end

class Ctui < Formula
  desc "Minimal terminal calendar and task list (TUI and CLI)"
  homepage "https://github.com/andples/ctui"
  version "0.2.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/ctui; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.0/ctui-aarch64-apple-darwin.tar.gz"
      sha256 "a1010aa37b678e4a10120ab4dd4ce1afe5dc61bf68b8888b17b58e22889b0ffb"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.0/ctui-x86_64-apple-darwin.tar.gz"
      sha256 "19cf79224f68a1b9d0e524d93d10f7c1be2c12db968824327bf32750cc85da43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.0/ctui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b7c259e3f636307295a537baaafc51d872898046808b5687abcaf3ef23352fad"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.0/ctui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4002caa023a8442a61413bc1cf0630a9d6394c0db352510d14f8f373b17e9d0b"
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

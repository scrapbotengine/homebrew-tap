class Scrapbot < Formula
  desc "Experimental, text-first game engine with embedded Luau scripting"
  homepage "https://github.com/scrapbotengine/scrapbot"
  version "0.1.0"
  license "Apache-2.0"

  depends_on :macos
  depends_on "sdl3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scrapbotengine/scrapbot/releases/download/v0.1.0/scrapbot-0.1.0-macos-arm64.tar.gz"
      sha256 "acddb888ca21e8ed57f32e5dbc0f2f1477f13afbdc68de04a05478fd821ec93a"
    else
      url "https://github.com/scrapbotengine/scrapbot/releases/download/v0.1.0/scrapbot-0.1.0-macos-x86_64.tar.gz"
      sha256 "dd85cc8e91140eb55b77302ba78290d7bca06ddf52ab5bc986806b9061baf433"
    end
  end

  def install
    bin.install "scrapbot"
    system "codesign", "--force", "--sign", "-", bin/"scrapbot"
  end

  test do
    assert_match "scrapbot #{version}", shell_output("#{bin}/scrapbot version")
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.111"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.111/phosphobot-0.3.111-arm64.bin"
      sha256 "da5153bab2f49f774a1f22e098d444cc7800e786f3b7d2419bebba7e67c3007a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.111/phosphobot-0.3.111-x86_64.bin"
      sha256 "f7e9cc934a8f1194ee9ca09eb8458de6ac33daff6e9aa452bd253bc4727081af"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.111-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

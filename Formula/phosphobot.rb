class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.125"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.125/phosphobot-0.2.125-arm64.bin"
      sha256 "75ecaa4092c04b73c707ede9be99f2da966064a035d2801f8f111b12eace2454"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.125/phosphobot-0.2.125-x86_64.bin"
      sha256 "7d5577d3f9cec1cbe48ec00f6641644d80b717e83f04456bebef2f7f60898b87"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.125-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.8"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.8/phosphobot-0.3.8-arm64.bin"
      sha256 "be15d426d5cec1ebbb21b95baaf4e6bad49e8139fef1cdbdd6f66505f5766f71"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.8/phosphobot-0.3.8-x86_64.bin"
      sha256 "11b705a3911b479c13f3241d41f8044fcccecb942f249c9cb6eb73787d574298"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.8-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

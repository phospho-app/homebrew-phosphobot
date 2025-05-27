class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.23"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.23/phosphobot-0.3.23-arm64.bin"
      sha256 "d8ece9c7d193e49a05077999a5805ad834fee58e078e96f5e1223d39b03f0e6b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.23/phosphobot-0.3.23-x86_64.bin"
      sha256 "d28b50f758155e028b007e5b27e6ae0d7dff51684ffff6289bbcfe883eb6074f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.23-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

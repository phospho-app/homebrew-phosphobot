class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.150"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.150/phosphobot-0.2.150-arm64.bin"
      sha256 "973e9c8cbc98d5e881f5716c73df24ec9d54409e6b43433d657d2b8a8ade8285"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.150/phosphobot-0.2.150-x86_64.bin"
      sha256 "1dfcee324d392ef0ba94cffb1083c0f309de3143c4e4fac33c7f5dc957767c6a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.150-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

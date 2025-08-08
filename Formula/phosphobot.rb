class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.85"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.85/phosphobot-0.3.85-arm64.bin"
      sha256 "bb0033c4b600d884276eb392d6e8d02a6a2fe3e70b3e83b3e4a47b3379796336"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.85/phosphobot-0.3.85-x86_64.bin"
      sha256 "479ff2570cf18a947f73847b1003ed993fa27a63ebcf3bc885a2d703cf00eb7c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.85-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

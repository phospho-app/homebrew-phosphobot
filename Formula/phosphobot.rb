class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.119"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.119/phosphobot-0.2.119-arm64.bin"
      sha256 "0672431c7e0270441c24b65777e6b168beae57c0d6b79bc6d54051e15d72d905"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.119/phosphobot-0.2.119-x86_64.bin"
      sha256 "3c68552c29f665ae5d3af964dda6ef54683609ef835815dbe35d2ea1ed6b066c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.119-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

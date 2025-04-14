class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.138"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.138/phosphobot-0.2.138-arm64.bin"
      sha256 "458a8c94c4fd2d7dcef56aba4b232934273b88f77571628c96f8d39d5c751735"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.138/phosphobot-0.2.138-x86_64.bin"
      sha256 "c6e7688d9baaf0b42d5331d2af7bae4b113d5e5bb04d41e95446cad650a04258"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.138-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

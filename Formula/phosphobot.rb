class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.177"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.177/phosphobot-0.2.177-arm64.bin"
      sha256 "1c4551d18f257bbe8f02b2d474a80578754bd0c46ea02c406c61b83fe739e212"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.177/phosphobot-0.2.177-x86_64.bin"
      sha256 "047816bb3d3c2959d735a905c3c7cf491c6230afa6fb196a73ddbfd6ed8bfe22"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.177-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.194"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.194/phosphobot-0.2.194-arm64.bin"
      sha256 "e5f372488ab9915af27dfb2ea0901fd708d35a2d9546dc9f4494d00239d6581e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.194/phosphobot-0.2.194-x86_64.bin"
      sha256 "7143a5534b1edb9593a8fe5a06862f7f5cb2e8e1895cbbddcee551708eb0c8d4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.194-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

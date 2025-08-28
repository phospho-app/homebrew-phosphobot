class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.106"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.106/phosphobot-0.3.106-arm64.bin"
      sha256 "2d836af8916995ebc9ebea3cb4db99617ce5fc0ebae9473a80a6f4b8ae6e2a7c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.106/phosphobot-0.3.106-x86_64.bin"
      sha256 "cb2d3d71598b730899e0c4f97b86cb355cc226d03c0c33a305860c105b125911"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.106-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

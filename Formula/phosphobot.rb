class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.74"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.74/phosphobot-0.3.74-arm64.bin"
      sha256 "4ceac40f8a7285819d6bc9d1cbe808c07cdf55ad09983c3799327d0dc242f4b4"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.74/phosphobot-0.3.74-x86_64.bin"
      sha256 "d8edbf2e77ad25b527845d22efc3c4a87672f66ee79eb01bec45b388773a3f58"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.74-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

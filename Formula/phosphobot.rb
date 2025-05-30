class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.27"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.27/phosphobot-0.3.27-arm64.bin"
      sha256 "fe91f5f4055bb42b6211b8078c45981abdcd8c9e4209261b85d7385599de4b56"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.27/phosphobot-0.3.27-x86_64.bin"
      sha256 "7c61ee1f03a8e56860366af2dc675269c2eb3a8e58109b3510fa8c5844b230f6"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.27-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

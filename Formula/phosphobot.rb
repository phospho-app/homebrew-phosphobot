class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.201"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.201/phosphobot-0.2.201-arm64.bin"
      sha256 "58f8b2298659069758a43c5836e57fca7fcf26ebb02f3d41f4c689a66b9e38c9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.201/phosphobot-0.2.201-x86_64.bin"
      sha256 "8a0c6452c475a55bb9e66547e216b46edbb289554e950e264d32cc5ff06e3f2c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.201-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

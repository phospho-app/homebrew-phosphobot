class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.159"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.159/phosphobot-0.2.159-arm64.bin"
      sha256 "d1757ed23b9f82db49e6545cf8f58553d38d88391412c88f81aa8999000fd39c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.159/phosphobot-0.2.159-x86_64.bin"
      sha256 "62579c6bce56fde37184e987dd7b4836fdb324d5a76d0fdafa9506866265952f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.159-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

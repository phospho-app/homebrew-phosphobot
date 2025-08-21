class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.96"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.96/phosphobot-0.3.96-arm64.bin"
      sha256 "98ec4f470fb31231a67b16d23f4cd6f4d4e5f916da0f9ca1188efb86b184825d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.96/phosphobot-0.3.96-x86_64.bin"
      sha256 "4ebbcb4ac2e18b25b56119a62bbae1df4c6e63bd9c0e4ca3211ce4e2e071d352"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.96-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

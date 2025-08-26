class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.103"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.103/phosphobot-0.3.103-arm64.bin"
      sha256 "d7af4756e0a7a4d618f243eb332bd02bb68036568ea6d5e86b1a343544f9acf7"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.103/phosphobot-0.3.103-x86_64.bin"
      sha256 "28c398c04d0177480960dcb6e4f1dc08d641e0430469b565fd60ca218f80d4ff"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.103-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

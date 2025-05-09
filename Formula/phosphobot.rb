class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.208"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.208/phosphobot-0.2.208-arm64.bin"
      sha256 "8e50f13b9402ec8dda8a79a8899f9050f722be15dcad0909b59d416e4109b255"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.208/phosphobot-0.2.208-x86_64.bin"
      sha256 "127630f1e63fb69d80a80d0e5b1517891451598133dee4e563b116756ed45d65"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.208-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

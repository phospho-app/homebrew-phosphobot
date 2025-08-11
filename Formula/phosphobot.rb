class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.86"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.86/phosphobot-0.3.86-arm64.bin"
      sha256 "2eed9f62128414fa8c16f625da8aa4fec535aa9b9a43d652131c1e731692a00e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.86/phosphobot-0.3.86-x86_64.bin"
      sha256 "da174ececc103b85fbcd3bec0e58213ad8c611cd0396094e17d78cbf578f941a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.86-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

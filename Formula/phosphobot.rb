class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.80"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.80/phosphobot-0.3.80-arm64.bin"
      sha256 "23e04e31c8cc934dd82c2b2272a4ef9d98508f111d220f1e57b83f05f2b7d011"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.80/phosphobot-0.3.80-x86_64.bin"
      sha256 "76dad13e02dfaa5aa5bf29c8274931abe98c7d2972b4f459de05543485d3b8f0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.80-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.41"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.41/phosphobot-0.3.41-arm64.bin"
      sha256 "35dddb6ecb7b0e1dd10867638a58a233931f22dc8ad47196a2d7ff0fc9f81c6c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.41/phosphobot-0.3.41-x86_64.bin"
      sha256 "5446b0ce80990dfb080e3ad2eaa8bbba864a2590c763140784602284c8748c53"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.41-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

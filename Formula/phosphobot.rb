class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.30"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.30/phosphobot-0.3.30-arm64.bin"
      sha256 "0ed0eecd5e71df36859384b3393ca4a3a048a4d52d12fafe36dba3b547a24b75"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.30/phosphobot-0.3.30-x86_64.bin"
      sha256 "f9fcf3087162752c702250617ba7254bbd5b5e633d7e655187106e7f827ade19"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.30-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

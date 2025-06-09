class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.39"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.39/phosphobot-0.3.39-arm64.bin"
      sha256 "92ebb15c9d95f5266a0d125beca58fec218c8a59197df3b583642304ff637d4c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.39/phosphobot-0.3.39-x86_64.bin"
      sha256 "a63df8cf1c5b64592990a26f9950174c9cdaa7a30cd266ab35bdf33722897aec"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.39-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

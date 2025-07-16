class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.59"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.59/phosphobot-0.3.59-arm64.bin"
      sha256 "99a9ed986eb77345caf6fb3e4ba17ef623bd11d27e5a218fb7bca5e8c89f9469"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.59/phosphobot-0.3.59-x86_64.bin"
      sha256 "98b576a7794e90e61b426feb756b5ded92824d7922769b746ff7d6307546aeda"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.59-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

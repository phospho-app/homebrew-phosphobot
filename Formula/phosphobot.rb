class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.164"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.164/phosphobot-0.2.164-arm64.bin"
      sha256 "342b04c3fdc7a70e840d9c76ade1a85b56305ba9dabfeb255b99975524dacef5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.164/phosphobot-0.2.164-x86_64.bin"
      sha256 "fadec99ecbfccbe1bc7cf7a1430cc6cb4f3a5bf07a7118d80cce6c207f1a72dc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.164-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

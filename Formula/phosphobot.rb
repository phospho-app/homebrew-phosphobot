class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.135"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.135/phosphobot-0.2.135-arm64.bin"
      sha256 "d477b50a7317fa387be4c83c82f9bab58f0ac2491c16c53460bfe3a4ba17cc16"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.135/phosphobot-0.2.135-x86_64.bin"
      sha256 "2bba455676e47d388845f5774617123c320f8b596db5a4c1dd27b8ce850eaf62"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.135-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

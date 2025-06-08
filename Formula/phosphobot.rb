class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.38"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.38/phosphobot-0.3.38-arm64.bin"
      sha256 "a73b47b2ff654e57a1eed33f8f02e285c8b67ba397df31e718825ebc6a8a7e81"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.38/phosphobot-0.3.38-x86_64.bin"
      sha256 "269115c589413bc4b7a4c609ecf2cb15784ff12dcb1fa136232b183acc81bed0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.38-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.198"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.198/phosphobot-0.2.198-arm64.bin"
      sha256 "a387bf8b6ce0766e4aa4df465224c13f60f5e80a408d0e81f9b6e4be66184c58"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.198/phosphobot-0.2.198-x86_64.bin"
      sha256 "4c6764602fb550b809ab798a526cabda7263fa2daf2912f330beb440c1539b7c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.198-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

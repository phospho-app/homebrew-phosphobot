class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.52"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.52/phosphobot-0.3.52-arm64.bin"
      sha256 "e7a54ac457039b2c2037d20a9b1c2dbf7d0bb336bedab61d3b395668b49ddd28"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.52/phosphobot-0.3.52-x86_64.bin"
      sha256 "e5f138098f2ada7a6151a550b60cf5cfeb72cea22b7bb050dfed468e4b55d788"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.52-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.115"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.115/phosphobot-0.2.115-arm64.bin"
      sha256 "a027fc48169e73b9c1337f023511d31d2e8c4b5bd6b6ba2693c963a3647514db"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.115/phosphobot-0.2.115-x86_64.bin"
      sha256 "4c04dee96a50a75a5af2b5eeb8eec43fa0acbd20d50235e945b5c9bb5b976591"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.115-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

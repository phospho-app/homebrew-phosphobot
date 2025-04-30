class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.188"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.188/phosphobot-0.2.188-arm64.bin"
      sha256 "4076b30a602a3d87d4389c1c4a46ad552e605a2e95c299ab5ffdd6c732c93639"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.188/phosphobot-0.2.188-x86_64.bin"
      sha256 "293bfa6368069c8c07c6e6120287247b92a504b461c6aa25ed31c1be2eed205b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.188-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

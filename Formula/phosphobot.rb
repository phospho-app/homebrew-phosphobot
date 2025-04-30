class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.187"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.187/phosphobot-0.2.187-arm64.bin"
      sha256 "73e9892242685171cb4721a516f6f99209862fe9cc39efefe6db2ac44a4a0ff6"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.187/phosphobot-0.2.187-x86_64.bin"
      sha256 "60fd3df482c23d9fec0013c756182171566b396a750e25c9972f7029fc985bbc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.187-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

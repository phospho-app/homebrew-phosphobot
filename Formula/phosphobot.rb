class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.58"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.58/phosphobot-0.3.58-arm64.bin"
      sha256 "b814336cef37d8268f8ba55b5b5103942cf03cd66ab8121e0b43a17deee90afb"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.58/phosphobot-0.3.58-x86_64.bin"
      sha256 "6b2419f6af9449091e2f30e4a7362d2377c547a7ee9f80d1d060b5ec81905d91"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.58-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

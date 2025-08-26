class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.102"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.102/phosphobot-0.3.102-arm64.bin"
      sha256 "04cc950c10a305c07107c32d5f999bc64152c75267ea33e3d5fbb8bb47a808dc"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.102/phosphobot-0.3.102-x86_64.bin"
      sha256 "606a5bc78919536445b700af97a3aa6dc56f8c963545f1bb883084aa16492abe"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.102-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

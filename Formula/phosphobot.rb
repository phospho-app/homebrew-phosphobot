class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.120"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.120/phosphobot-0.3.120-arm64.bin"
      sha256 "51b80de0f6c367449b9210efd83cd9f36de24944b3b388cdab536ad37261bb13"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.120/phosphobot-0.3.120-x86_64.bin"
      sha256 "68ca44013d0723225b93a33b96b123c6739824bbe720e0f5252d2bf7efdb318c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.120-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

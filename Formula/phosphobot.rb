class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version ""
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.107/phosphobot-0.3.107-arm64.bin"
      sha256 "b94a304a93e44b2722a114f69c233522b8570987477eb0883e65e7de282759cc"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.107/phosphobot-0.3.107-x86_64.bin"
      sha256 "f2e48dea6704143b2767029bbb33ebf402803a39eab58bdccede1c9bdd991f33"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot--#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

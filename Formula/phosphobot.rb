class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.63"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.63/phosphobot-0.3.63-arm64.bin"
      sha256 "eccb70fcfe9c3b0b5694f9adbec7ba1563e8b4f387d4e69a68e4b379d2fe6e5e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.63/phosphobot-0.3.63-x86_64.bin"
      sha256 "91971ef2a42635eec053052a664942736dceec40c6e969b687139535972938d0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.63-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

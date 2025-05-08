class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.207"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.207/phosphobot-0.2.207-arm64.bin"
      sha256 "6a8e58df06dc626b8d88370d8969d374ea1d13ae1713c5fd6b5083688c15b82e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.207/phosphobot-0.2.207-x86_64.bin"
      sha256 "7d9169a9f7b54a9018ced30243c48455816eeac2648b2d88f64b9a68f47dfdf7"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.207-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

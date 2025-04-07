class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.114"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.114/phosphobot-0.2.114-arm64.bin"
      sha256 "4530e184f118074fea0bdd8202cdf28acbeb7fc413647b76c525197d6111b31a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.114/phosphobot-0.2.114-x86_64.bin"
      sha256 "bb3f741260eab2d778d40e05aafd6213801727243bc85edddf55375130b5f950"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.114-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

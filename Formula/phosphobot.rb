class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.195"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.195/phosphobot-0.2.195-arm64.bin"
      sha256 "4d5d0d77200092bcaa64972a8da7c7137e9bc6cb81660cadff68c06753b93e25"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.195/phosphobot-0.2.195-x86_64.bin"
      sha256 "62c67bef338525aa0372a7924e6bd1110f4aa75462da6b6548ec91a41ff7e06a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.195-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

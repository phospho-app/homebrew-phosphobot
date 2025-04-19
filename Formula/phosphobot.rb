class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.153"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.153/phosphobot-0.2.153-arm64.bin"
      sha256 "d377073d4bac354434cf429604bef8c05637ed44047d1fc98f08e11d6bc628e8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.153/phosphobot-0.2.153-x86_64.bin"
      sha256 "9ba46a8bc54a7b9d9b3407240c0cb76d59bd51701a161637a841ba1afcf23dfa"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.153-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end

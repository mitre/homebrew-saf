require "language/node"

class SafCli < Formula
  desc "CLI for streamlining security automation of systems and DevOps pipelines"
  homepage "https://github.com/mitre/saf"
  url "https://registry.npmjs.org/@mitre/saf/-/saf-1.4.16.tgz"
  sha256 "4f7f1657a8fbdc8f8ba8e4b67db39d05c0b5407f5d85decef8271d8cffff0d7e"
  license "Apache-2.0"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"saf", "--help"
    assert_match "@mitre/saf/#{version}", shell_output("#{bin}/saf --version")
    assert_match "Visit https://saf.mitre.org/#/validate", shell_output("#{bin}/saf --scan")
  end
end

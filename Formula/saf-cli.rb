require "language/node"

class SafCli < Formula
  desc "CLI for streamlining security automation of systems and DevOps pipelines"
  homepage "https://github.com/mitre/saf"
  url "https://registry.npmjs.org/@mitre/saf/-/saf-1.3.1.tgz"
  sha256 "0a0c62e80c2b7f8c4dee74a3e377d8b55133c20473705d3b9c962f5364c3d090"
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

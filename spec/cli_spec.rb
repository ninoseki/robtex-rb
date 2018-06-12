require 'json'

describe Robtex::CLI, :vcr do
  describe "#as" do
    it "should ouput a valid JSON" do
      output = capture(:stdout) { Robtex::CLI.start %w(as 1234) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end

  describe "#ip" do
    it "should ouput a valid JSON" do
      output = capture(:stdout) { Robtex::CLI.start %w(ip 199.19.54.1) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end

  describe "#rpdns" do
    it "should ouput a valid JSON" do
      output = capture(:stdout) { Robtex::CLI.start %w(rpdns a.iana-servers.net) }
      json = JSON.parse(output)
      expect(json).to be_a(Array)
    end
  end

  describe "#fpdns" do
    it "should ouput a valid JSON" do
      output = capture(:stdout) { Robtex::CLI.start %w(fpdns a.iana-servers.net) }
      json = JSON.parse(output)
      expect(json).to be_a(Array)
    end
  end
end

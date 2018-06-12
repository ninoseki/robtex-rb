describe Robtex::API, :vcr do
  describe "#as" do
    it "should return a JSON if it's given a valid AS number" do
      json = subject.as("1234")
      expect(json["status"]).to eq("ok")
    end
  end

  describe "#ip" do
    it "should return a JSON if it's given a valid IP" do
      json = subject.ip("199.19.54.1")
      expect(json["status"]).to eq("ok")
    end
  end

  describe "#rpdns" do
    it "should return a JSON if it's given a valid domain" do
      json = subject.rpdns("a.iana-servers.net")
      expect(json.first["rrdata"]).to eq("a.iana-servers.net")
    end
  end

  describe "#fpdns" do
    it "should return a JSON if it's given a valid domain" do
      json = subject.fpdns("a.iana-servers.net")
      expect(json.first["rrname"]).to eq("a.iana-servers.net")
    end
  end
end

require 'rails_helper'
module Channels
  RSpec.describe Creator do
    let(:server) {FactoryBot.create(:server, 
      name: "testmirth",
      uid: '3fa4fc38-1cb6-40ad-b91f-4aa7f3e44776',
    )}
    let(:properties) {{
     'uid' => '445cda00-c847-4198-a9be-eb0dc6b5946d',
     'testdummy' => 'babbelfasel',
    }}
    subject { Channels::Creator.new(server: server, properties: properties) }

    # check for instance methods
    describe "check if instance methods exists" do
      it { expect(subject).to be_kind_of(Channels::Creator) }
      it { expect(subject.respond_to? :save).to be_truthy }
    end

    describe "#new" do
      context "without :server" do
        it "raises a KeyError" do
          expect {
            Creator.new(properties: {})
          }.to raise_error(KeyError)
        end
      end
      context "without :properties" do
        it "raises a KeyError" do
          expect {
            Creator.new(server: server)
          }.to raise_error(KeyError)
        end
      end
      context "without :uid or properties['uid']" do
        it "raises an ArgumentError" do
          expect {
            Creator.new(server: server, properties: {})
          }.to raise_error(ArgumentError)
        end
      end
    end

    describe "#save" do
      context "new channel" do
        it "create a new channel" do
          expect {
            subject.save
          }.to change(Channel, :count).by(1)
        end
        it "set uid" do
          expect(subject.save).to be_truthy
          expect(server.channels.first.uid).to eq("445cda00-c847-4198-a9be-eb0dc6b5946d")
        end
      end
      context "with existing channel" do
        let!(:channel) { FactoryBot.create(:channel,
          server_id: server.id,
          uid: '445cda00-c847-4198-a9be-eb0dc6b5946d',
          properties: { 'testdummy' => 'LoremIpsum' },
        )}
        it "does not create a channel" do
          expect {
            subject.save
          }.to change(Channel, :count).by(0)
        end
        it "set properties" do
          expect(subject.save).to be_truthy
          channel.reload
          expect(channel.properties).to include('testdummy' => 'babbelfasel')
        end
      end
    end
  end
end

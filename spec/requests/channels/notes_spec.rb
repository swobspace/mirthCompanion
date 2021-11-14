require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

module Channels
  RSpec.describe "Notes", type: :request do
    let!(:server) { FactoryBot.create(:server, name: "MyServer") }
    let!(:channel) { FactoryBot.create(:channel, server: server, name: "MyChannel") }
    let!(:user) { FactoryBot.create(:user) }
    
    let(:valid_attributes) {{
      server_id: server.id,
      channel_id: channel.id,
      type: 'acknowledge',
      message: "some special stuff",
      user_id: user.id
    }}

    let(:post_attributes) {{
      server_id: server.id,
      channel_id: channel.id,
      message: "some special stuff",
    }}

    let(:invalid_attributes) {{
      type: 'very wrong type',
    }}

    before(:each) do
      login_admin
    end

    describe "GET /index" do
      it "renders a successful response" do
        Note.create! valid_attributes
        get channel_notes_url(channel)
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        note = Note.create! valid_attributes
        get channel_note_url(channel, note)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_channel_note_url(channel)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        note = Note.create! valid_attributes
        get edit_channel_note_url(channel, note)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Note" do
          expect {
            post channel_notes_url(channel), params: { note: post_attributes }
          }.to change(Note, :count).by(1)
        end

        it "redirects to the created note" do
          post channel_notes_url(channel), params: { note: post_attributes }
          expect(response).to redirect_to(channel_url(channel, anchor: 'notes'))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Note" do
          expect {
            post channel_notes_url(channel), params: { note: invalid_attributes }
          }.to change(Note, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post channel_notes_url(channel), params: { note: invalid_attributes }
          expect(response).not_to be_successful
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {{
          message: "some other text"
        }}

        it "updates the requested note" do
          note = Note.create! valid_attributes
          patch channel_note_url(channel, note), params: { note: new_attributes }
          note.reload
          expect(note.message.to_plain_text).to eq("some other text")
        end

        it "redirects to the note" do
          note = Note.create! valid_attributes
          patch channel_note_url(channel, note), params: { note: new_attributes }
          note.reload
          expect(response).to redirect_to(channel_url(channel, anchor: 'notes'))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          note = Note.create! valid_attributes
          patch channel_note_url(channel, note), params: { note: invalid_attributes }
          expect(response).not_to be_successful
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested note" do
        note = Note.create! valid_attributes
        expect {
          delete channel_note_url(channel, note)
        }.to change(Note, :count).by(-1)
      end

      it "redirects to the notes list" do
        note = Note.create! valid_attributes
        delete channel_note_url(channel, note)
        expect(response).to redirect_to(channel_url(channel, anchor: 'notes'))
      end
    end
  end
end

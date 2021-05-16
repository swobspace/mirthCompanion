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

RSpec.describe "/servers", type: :request do
  
  # Server. As you add validations to Server, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Server.create! valid_attributes
      get servers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      server = Server.create! valid_attributes
      get server_url(server)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_server_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      server = Server.create! valid_attributes
      get edit_server_url(server)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Server" do
        expect {
          post servers_url, params: { server: valid_attributes }
        }.to change(Server, :count).by(1)
      end

      it "redirects to the created server" do
        post servers_url, params: { server: valid_attributes }
        expect(response).to redirect_to(server_url(Server.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Server" do
        expect {
          post servers_url, params: { server: invalid_attributes }
        }.to change(Server, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post servers_url, params: { server: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested server" do
        server = Server.create! valid_attributes
        patch server_url(server), params: { server: new_attributes }
        server.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the server" do
        server = Server.create! valid_attributes
        patch server_url(server), params: { server: new_attributes }
        server.reload
        expect(response).to redirect_to(server_url(server))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        server = Server.create! valid_attributes
        patch server_url(server), params: { server: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested server" do
      server = Server.create! valid_attributes
      expect {
        delete server_url(server)
      }.to change(Server, :count).by(-1)
    end

    it "redirects to the servers list" do
      server = Server.create! valid_attributes
      delete server_url(server)
      expect(response).to redirect_to(servers_url)
    end
  end
end

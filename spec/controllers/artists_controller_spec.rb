require 'rails_helper'

describe ArtistsController do
  let(:valid_attributes) {
    { name: 'Artist Name' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      artist = Artist.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      artist = Artist.create! valid_attributes
      get :show, params: {id: artist.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      artist = Artist.create! valid_attributes
      get :edit, params: {id: artist.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, params: {artist: valid_attributes}, session: valid_session
        }.to change(Artist, :count).by(1)
      end

      it "redirects to the created artist" do
        post :create, params: {artist: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {artist: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'New Artist Name' }
      }

      it "updates the requested artist" do
        artist = Artist.create! valid_attributes
        put :update, params: {id: artist.to_param, artist: new_attributes}, session: valid_session
        artist.reload

        expect(artist.name).to eq 'New Artist Name'
      end

      it "redirects to the artist" do
        artist = Artist.create! valid_attributes
        put :update, params: {id: artist.to_param, artist: valid_attributes}, session: valid_session
        expect(response).to redirect_to(artist)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        artist = Artist.create! valid_attributes
        put :update, params: {id: artist.to_param, artist: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested artist" do
      artist = Artist.create! valid_attributes
      expect {
        delete :destroy, params: {id: artist.to_param}, session: valid_session
      }.to change(Artist, :count).by(-1)
    end

    it "redirects to the artists list" do
      artist = Artist.create! valid_attributes
      delete :destroy, params: {id: artist.to_param}, session: valid_session
      expect(response).to redirect_to(artists_url)
    end
  end

end

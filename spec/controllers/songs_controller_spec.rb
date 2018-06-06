require 'rails_helper'

describe SongsController do
  let(:artist) { Artist.create(name: 'Artist Name') }

  let(:valid_attributes) {
    { title: 'Song Title', body: '[C] [F] [C] [G]', artist_id: artist.id}
  }

  let(:invalid_attributes) {
    { title: nil, body: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      song = Song.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      song = Song.create! valid_attributes
      get :show, params: {id: song.to_param}, session: valid_session
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
      song = Song.create! valid_attributes
      get :edit, params: {id: song.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, params: {song: valid_attributes}, session: valid_session
        }.to change(Song, :count).by(1)
      end

      it "redirects to the created song" do
        post :create, params: {song: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Song.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {song: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'New Title', body: '[D] [G] [D] [A]' }
      }

      it "updates the requested song" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: new_attributes}, session: valid_session
        song.reload

        expect(song.title).to eq 'New Title'
        expect(song.body). to eq '[D] [G] [D] [A]'
      end

      it "redirects to the song" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: valid_attributes}, session: valid_session
        expect(response).to redirect_to(song)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, params: {id: song.to_param}, session: valid_session
      }.to change(Song, :count).by(-1)
    end

    it "redirects to the songs list" do
      song = Song.create! valid_attributes
      delete :destroy, params: {id: song.to_param}, session: valid_session
      expect(response).to redirect_to(songs_url)
    end
  end

end

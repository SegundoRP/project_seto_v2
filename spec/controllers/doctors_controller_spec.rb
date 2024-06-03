require 'rails_helper'

RSpec.describe DoctorsController, :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:doctor) { create(:doctor) }

    before do
      sign_in(user)
      get :index
    end

    it 'returns message of doctors amount' do
      expect(flash.now[:notice]).to eq("Tienes 1 especialista")
    end
  end
end

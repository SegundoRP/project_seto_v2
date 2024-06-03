require 'rails_helper'

RSpec.describe 'Doctors', :request do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:doctor) { create(:doctor) }

    before do
      sign_in(user)
      get ''
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns total of doctors' do
      expect(Doctor.count).to eq(1)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Doctors', :request do
  let(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    before { get '' }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns total of doctors' do
      expect(Doctor.count).to eq(1)
    end
  end

  describe 'GET #show' do
    before { get doctor_path(doctor), params: { id: doctor.id } }

    it 'returns a success response' do
      p response
      expect(response).to have_http_status(:success)
    end

    it 'returns doctor information' do
      expect(response.body).to include(doctor.first_name)
      expect(assigns(doctor)).to eq(doctor)
    end
  end
end

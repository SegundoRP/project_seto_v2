require 'rails_helper'

RSpec.describe 'Doctors', :request do
  let(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    before { get doctors_path }

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
      expect(response).to have_http_status(:success)
    end

    it 'returns doctor information' do
      expect(response.body).to include(doctor.first_name)
    end
  end

  describe 'POST #create' do
    context 'when record is valid' do
      it 'returns a success response' do
        post doctors_path, params: { doctor: { first_name: 'Second', last_name: 'Rebaza', profession: 'Psicologia',
                                               user: } }
        expect(response).to redirect_to(doctor_path(Doctor.last))
        expect(flash[:notice]).to eq(I18n.t('doctors.create.success'))
      end
    end

    context 'when record is invalid' do
      it 'returns a failed response' do
        post doctors_path, params: { doctor: { first_name: nil, last_name: nil, profession: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(flash[:alert]).to eq(I18n.t('doctors.create.failure'))
      end
    end
  end
end

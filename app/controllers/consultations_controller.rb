class ConsultationsController < ApplicationController
  before_action :set_consultation, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!

  def index
    @consultations = Consultation.all

    flash.now[:notice] = "Tienes #{helpers.pluralize(@consultations.count, 'consulta', plural: 'consultas')} en total"
  end

  def show; end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)

    if @consultation.save
      redirect_to consultation_path(@consultation), notice: t('.success')
    else
      render :new, status: :unprocessable_entity, alert: t('.failure')
    end
  end

  def edit; end

  def update
    if @consultation.update(consultation_params)
      redirect_to consultation_path(@consultation), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, alert: t('.failure')
    end
  end

  def destroy
    if @consultation.destroy
      redirect_to consultations_path, notice: t('.success')
    else
      render :show, status: :see_other, alert: t('.failure')
    end
  end

  private

  def set_consultation
    @consultation = Consultation.find(params[:id])
  end

  def consultation_params
    params.require(:consultation).permit(:date, :status, :summary, :reason_consultation, :doctor_id, :patient_id,
                                         :type_of_service_id)
  end
end

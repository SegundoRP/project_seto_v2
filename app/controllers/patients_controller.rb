class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = Patient.all

    flash.now[:notice] = "Tienes #{@patients.size}" + " paciente".pluralize(@patients.count)
  end

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patient_path(@patient), notice: t('.success')
    else
      render :new, status: :unprocessable_entity, alert: flash[:alert] = t('.failure')
    end
  end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, alert: flash[:alert] = t('.failure')
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, status: :see_other, notice: t('.success')
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :email, :phone, :address, :civil_state,
                                    :children, :instruction_grade, :occupation)
  end
end

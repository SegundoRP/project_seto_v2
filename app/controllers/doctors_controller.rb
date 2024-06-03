class DoctorsController < ApplicationController
  before_action :doctor, only: %i[show edit update destroy]

  def index
    @doctors = Doctor.all
    # debugger
    flash.now[:notice] = "Tienes #{@doctors.count}" + " especialista".pluralize(@doctors.count)
  end

  def show; end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctor_path(@doctor), notice: t('.success')
    else
      render :new, status: :unprocessable_entity, alert: t(".failure")
    end
  end

  def edit; end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, alert: t(".failure")
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to doctor_path(@doctor), notice: t('.success')
    else
      render :show, status: :unprocessable_entity, alert: t(".failure")
    end
  end

  private

  def doctor
    @doctor ||= Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :age, :profession, :specialty, :college_number)
          .merge(user: current_user)
  end
end

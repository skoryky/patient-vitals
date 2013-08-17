class VitalsReadingsController < ApplicationController
  before_action :set_vitals_reading, only: [:show, :edit, :update, :destroy]

  # GET /vitals_readings
  def index
    @vitals_readings = VitalsReading.all
  end

  # GET /vitals_readings/1
  def show
  end

  # GET /vitals_readings/new
  def new
    @vitals_reading = VitalsReading.new
  end

  # GET /vitals_readings/1/edit
  def edit
  end

  # POST /vitals_readings
  def create
    @vitals_reading = VitalsReading.new(vitals_reading_params.merge(patient_id: params[:patient_id]))  # TODO: Not right at all.
    p @vitals_reading
    if @vitals_reading.save
      p 'good'
      redirect_to patients_path, notice: 'Vitals reading was successfully created.'
    else
      p @vitals_reading.errors.messages
      render action: 'new'
    end
  end

  # PATCH/PUT /vitals_readings/1
  def update
    if @vitals_reading.update(vitals_reading_params)
      redirect_to @vitals_reading, notice: 'Vitals reading was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /vitals_readings/1
  def destroy
    @vitals_reading.destroy
    redirect_to vitals_readings_url, notice: 'Vitals reading was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitals_reading
      @vitals_reading = VitalsReading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vitals_reading_params
      params[:vitals_reading].permit(:bp_diastolic, :bp_systolic, :heart_rate, :respiratory_rate, :temperature_celsius)
    end
end

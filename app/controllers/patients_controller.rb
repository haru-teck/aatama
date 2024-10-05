class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy, :select]
  
  def index
    @patients = Patient.all
    @patient = Patient.new
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.build(patient_params)
    @patient.furigana = normalize_furigana(@patient.furigana)
    if @patient.save
      redirect_to patients_path, notice: '患者を登録しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: '患者情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: '患者情報が削除されました'
  end

  def search
    @patients = Patient.where("furigana LIKE ?", "%#{params[:query]}%").limit(5)
    puts "Search query: #{params[:query]}"
    puts "Found patients: #{@patients.map(&:name)}"
    render json: @patients.map { |p| { id: p.id, name: p.name, furigana: p.furigana } }
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def search
    @patients = Patient.where("furigana LIKE ?", "%#{params[:query]}%").limit(5)
    render json: @patients.map { |p| { id: p.id, name: p.name, furigana: p.furigana } }
  end


  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :furigana, :birthday, :gender)
  end

  def normalize_furigana(furigana)
    furigana.gsub(/[[:space:]]/, '　').strip # すべてのスペースを全角スペースに変換し、前後の空白を削除
  end
end
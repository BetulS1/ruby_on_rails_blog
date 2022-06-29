class DataController < ApplicationController
  before_action :set_datum, only: %i[ show edit update destroy ]
  # giriş yapmayan kullanıcı sadece show ve index sayfalarını görüntüler ekleme, düzenleme ve silme yapmaz
  before_action :authenticate_user!, except: [:index , :show]
  # kullanıcı yalnızca kendine ait veriler ile işlem yapmalı 
  before_action :user_control, only: [:edit, :update, :destroy]
  # GET /data or /data.json
  def index
    @data = Datum.all
  end

  # GET /data/1 or /data/1.json
  def show
  end

  # GET /data/new
  def new
    # @datum = Datum.new
    @datum = current_user.datum.build
  end

  # GET /data/1/edit
  def edit
  end

  def user_control 
    @datum = current_user.datum.find_by(id:params[:id])
    redirect_to datum_path, notice: "İşlem yapılamaz!" if @datum.nil? 
  end


  # POST /data or /data.json
  def create
    # @datum = Datum.new(datum_params)
    @datum = current_user.datum.build(datum_params)

    respond_to do |format|
      if @datum.save
        format.html { redirect_to datum_url(@datum), notice: "Yorum başarıyla oluşturuldu." }
        format.json { render :show, status: :created, location: @datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data/1 or /data/1.json
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.html { redirect_to datum_url(@datum), notice: "Yorum başarıyla güncellendi." }
        format.json { render :show, status: :ok, location: @datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1 or /data/1.json
  def destroy
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to data_url, notice: "Yorum başarıyla silindi" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def datum_params
      params.require(:datum).permit(:ad, :marka, :yorum, :user_id)
    end
end

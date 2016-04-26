class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_filter :load_thinker

  # GET /references
  # GET /references.json
  def index
    @references = @thinker.references.all
  end

  # GET /references/1
  # GET /references/1.json
  def show
    @reference = @thinker.references.find(params[:id])
  end

  # GET /references/new
  def new
    @reference = @thinker.references.new
  end

  # GET /references/1/edit
  def edit
    @reference = @thinker.references.find(params[:id])
  end

  # POST /references
  # POST /references.json
  def create
    @reference = @thinker.references.new(params[:reference])

    respond_to do |format|
      if @reference.save
        format.html { redirect_to [@thinker, @reference], notice: 'Reference was successfully created.' }
        format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :new }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    @reference = @thinker.references.find(params[:id])

    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to [@thinker, @reference], notice: 'Reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @reference }
      else
        format.html { render :edit }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference = @thinker.references.find(params[:id])
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to thinker_references_path(@thinker), notice: 'Reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      params.require(:reference).permit(:authors, :publishing_year, :title, :publisher, :place_of_publication, :thinker_id)
    end

    def load_thinker
     @thinker = Thinker.find(params[:thinker_id])
    end
end

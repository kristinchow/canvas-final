# grade controller
class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit; end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)
    @grade.assignment = Assignment.find(params[:assignment])
    @grade.user = User.find(params[:user])
    @grade.user.grades << @grade
    redirect_to @grade.user
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade.user, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade.user }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:score, :assignment_id)
  end
end

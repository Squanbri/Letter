class CompetenciesController < ApplicationController
  before_action :set_category, only: %i[show create]
  before_action :set_competency, only: %i[edit update]

  def show
    @competencies = @category.competencies
    @competency = Competency.new
  end

  def create
    @competency = @category.competencies.create(competency_params)
    @competency.save
    redirect_to category_competency_path(@competency.category, @competency)
  end

  def edit
    @category = @competency.category
  end

  def update
    @competency.update_attributes(competency_params)
    redirect_to category_competency_path(@competency.category, @competency)
  end

  def destroy
    @competency = Competency.find(params[:category_id && :id])
    @competency.destroy
    redirect_to category_competency_path(@competency.category, @competency)
  end

  private
  def competency_params
    params.require(:competency).permit(:title)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
  def set_competency
    @competency = Competency.find(params[:id])
  end
end

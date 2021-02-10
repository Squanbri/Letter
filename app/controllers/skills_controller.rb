class SkillsController < ApplicationController
  before_action :set_competency, only: %i[show create]
  before_action :set_skill,      only: %i[edit update destroy]

  def show
    @category = @competency.category
    @skills = @competency.skills
    @skill = Skill.new
  end

  def create
    @skill = @competency.skills.create(skill_params)
    @skill.save
    redirect_to category_competency_skill_path(@skill.competency.category, @skill.competency, @skill)
  end

  def edit
    @competency = @skill.competency
    @category = @competency.category
  end

  def update
    @skill.update_attributes(skill_params)
    redirect_to category_competency_skill_path(@skill.competency.category, @skill.competency, @skill)
  end

  def destroy
    @skill.destroy
    redirect_to category_competency_skill_path(@skill.competency.category, @skill.competency, @skill)
  end

  private

  def skill_params
    params.require(:skill).permit(:title)
  end

  def set_competency
    @competency = Competency.find(params[:competency_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end


class SubSkillsController < ApplicationController
  before_action :set_skill, only: %i[show create]

  def show
    @category   = @skill.competency.category
    @competency = @skill.competency
    @sub_skills = @skill.sub_skills
    @sub_skill  = SubSkill.new
  end

  def create
    @sub_skill = @skill.sub_skills.create(sub_skill_params)
    @sub_skill.save
    redirect_to category_competency_skill_sub_skill_path(@sub_skill.skill.competency.category, @sub_skill.skill.competency, @sub_skill.skill, @sub_skill)
  end

  def edit
    @sub_skill  = SubSkill.find(params[:id])
    @skill      = @sub_skill.skill
    @competency = @skill.competency
    @category   = @competency.category
  end

  def update
    @sub_skill = SubSkill.find(params[:id])
    @sub_skill.update_attributes(sub_skill_params)
    redirect_to category_competency_skill_sub_skill_path(@sub_skill.skill.competency.category, @sub_skill.skill.competency, @sub_skill.skill, @sub_skill)
  end

  def destroy
    @sub_skill = SubSkill.find(params[:id])
    @sub_skill.destroy
    redirect_to category_competency_skill_sub_skill_path(@sub_skill.skill.competency.category, @sub_skill.skill.competency, @sub_skill.skill, @sub_skill)
  end

  # def destroy
  #   @skill = Skill.find(params[:competency_id && :category_id && :id])
  #   @skill.destroy
  #   redirect_to category_competency_skill_path(@skill.competency.category, @skill.competency, @skill)
  # end


  private
  def sub_skill_params
    params.require(:sub_skill).permit(:title)
  end

  def set_skill
    @skill = Skill.find(params[:skill_id])
  end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @competency = Competency.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def edit
  end

  def update
    @category.update_attributes(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def get_categories
    @categories = Category.all
    render :json => @categories.as_json(include: {
      competencies: { include: { skills: { include: { sub_skills: { only: :title } }, only: :title } }, only: :title }

    }, only: :title)
    # render :json => @categories.as_json(include: { competencies: {
    #   include: { skills: {
    #     only: :title } },
    #   only: :title } })
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end

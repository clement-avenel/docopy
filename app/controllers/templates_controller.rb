class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_templates, only: :index

  def index
  end

  def new
    @template = Template.new
    render :new
  end

  def show
    @template = Template.find(params[:id])
    render :show
  end
  def create
    @template = Template.new(template_params)
    if @template.save
      flash[:success] = "New template successfully added!"
      redirect_to templates_path
    else
      render json: { message: @template.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @template = Template.find(params[:id])
    if @template.update(params.require(:template).permit(:title, :description, :document))
      flash[:success] = "Template item successfully updated!"
      redirect_to template_url(@template)
    else
      flash.now[:error] = "Template item update failed"
      render :edit
    end
  end

  def edit
    @template = Template.find(params[:id])
    render :edit
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    flash[:success] = "The template item was successfully destroyed."
    redirect_to templates_url
  end

  private

  def load_templates
    @templates = Template.order("created_at")
  end

  def template_params
    params.require(:template).permit(:title, :description, :document)
  end
end

class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [:show, :edit, :update, :destroy]
  before_action :load_templates, only: :index

  def index
  end

  def new
    @template = current_user.templates.new
    render :new
  end

  def show
    @template = current_user.templates.find(params[:id])
    render :show
  end
  def create
    @template = current_user.templates.new(template_params)
    if @template.save
      flash[:success] = "New template successfully added!"
      redirect_to templates_path
    else
      render json: { message: @template.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @template = current_user.templates.find(params[:id])
    if @template.update(params.require(:template).permit(:title, :description, :template_file))
      flash[:success] = "Template item successfully updated!"
      redirect_to template_url(@template)
    else
      flash.now[:error] = "Template item update failed"
      render :edit
    end
  end

  def edit
    @template = current_user.templates.find(params[:id])
    render :edit
  end

  def destroy
    @template = current_user.templates.find(params[:id])
    @template.destroy
    flash[:success] = "The template item was successfully destroyed."
    redirect_to templates_path
  end

  private

  def require_permission
    if Template.find(params[:id]).creator != current_user
      redirect_to templates_path, flash: { error: "You do not have permission to do that." }
    end
  end

  def load_templates
    @templates = current_user.templates.order("created_at")
  end

  def template_params
    params.require(:template).permit(:title, :description, :template_file)
  end
end

class CategoriesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  # GET /categories or /categories.json
  def index
    @categories = @user.categories.includes(:category_entities, :entities)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = @user.categories.find(params[:id])
    @entity = @category.entities.order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = @user.categories.new
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories or /categories.json
  def create
    @category = @user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to user_categories_path(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @user.categories.update(category_params)
        format.html { redirect_to user_categories_path(@user,@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = @user.categories.find(params[:id])

    respond_to do |format|
      if @category.destroy
        format.html { redirect_to user_categories_path, notice: "Category was successfully destroyed." }
      else
        format.html { redirect_to user_categories_path, alert: "Failed to destroy category." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :image)
    end
end

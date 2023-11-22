class EntitiesController < ApplicationController
  before_action :set_user

  # GET /entities or /entities.json
  def index
    @entities = @user.entities.all
  end

  # GET /entities/1 or /entities/1.json
  def show
    @entity = @user.entities.find(params[:id])
  end

  # GET /entities/new
  def new
    @entity = @user.entities.new
  end

  # GET /entities/1/edit
  def edit
    @entity = @user.entities.find(params[:id])
  end

  # POST /entities or /entities.json
  def create
    @entity = @user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        category = Category.find(params[:entity][:category_id])
        @entity.category_entities.create(category: category)
        format.html { redirect_to user_category_path(@user, category), notice: "Entity was successfully created." }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
 # PATCH/PUT /entities/1 or /entities/1.json
  def update
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.update(entity_params)
        new_category_id = params[:entity][:category_id]

        if @entity.category_entities.first
          old_category_id = @entity.category_entities.first.category_id
        else
          old_category_id = nil
        end

        if old_category_id != new_category_id
          new_category = Category.find(new_category_id)

          if @entity.category_entities.first
            # Update the existing category_entity with the new category
            @entity.category_entities.update(category: new_category)
          else
            # Create a new category_entity with the new category
            @entity.category_entities.create(category: new_category)
          end
        end

        format.html { redirect_to user_entities_path(@entity), notice: "Entity was successfully updated." }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.destroy
      format.html { redirect_to user_entities_path, notice: "Entity was successfully destroyed." }
      format.json { head :no_content }
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
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end

class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  before_action :remove_all_fields, only: [:update]

  respond_to :json

  def index
    @items = current_user.company.items
    render
  end

  def show
    # need to capture exceptions since this returns null if the :id doesn't belong to the page
    @item = current_user.company.items.find_by(id: params[:id])
    render
  end

  def create
    @item = Item.new(item_params)
    @item.company_id = current_user.company_id
    section = current_user.company.sections.find(params[:section_id])

    if section
      @item.order = section.items.length + 1
    end

    params[:fields].length.times do
      @item.fields.build
    end

    if @item.save
      @item.fields.each_with_index do |field, index| # Fields automatically saved
        field.company_id = current_user.company_id

        template = FieldTemplate.find(params[:fields][index][:field_template_id]) # Store the chosen template so we can access it later when creating the attributes
        attributes = HashWithIndifferentAccess.new(params[:fields][index])[:attributes] # Get the attributes from the field in question

        attributes.each do |attribute| # Each attribute inside the field
          attribute = FieldAttribute.create( # Create the field attribute in the DB
            :field_id => field.id,
            :company_id => current_user.company_id,
            :field_template_attribute_id => attribute[:id], # Store the reference to the field template attribute
            :value => attribute[:value]
          )
        end
      end

      render
    else
      render json: { errors: @item.errors }, status: 422
    end
  end

  def update
    @item = current_user.company.items.find(params[:id])
    params[:fields].length.times do
      @item.fields.build
    end

    if @item.update(item_params)
      @item.fields.each_with_index do |field, index|
        field.company_id = current_user.company_id

        template = FieldTemplate.find(params[:item][:field_template_id]) # Store the chosen template so we can access it later when creating the attributes

        # Loop through the attributes in the hash
        attributes = HashWithIndifferentAccess.new(params[:fields][index])
        attributes.each do |key, value|
          template_attribute = template.field_template_attributes.find_by name: key
          attribute = FieldAttribute.create(
            :field_id => field.id,
            :company_id => current_user.company_id,
            :field_template_attribute_id => template_attribute.id,
            :value => value
          )
        end
      end

      render
    else
      render json: { errors: @item.errors }, status: 422
    end
  end

  def destroy
    item = current_user.company.items.find(params[:id])
    item.destroy
    head 204
  end

  # Reorder the sites
  def reorder
    params[:order].each do |value|
      Item.find(value[:id]).update_attribute(:order,value[:order])
    end
    render :nothing => true
  end

  private
    def remove_all_fields
      @item = current_user.company.items.find(params[:id])

      @item.fields.delete_all
    end

    def item_params
      params.require(:item).permit(:title, :section_id, fields_attributes: [:field_template_id, :value])
    end
end
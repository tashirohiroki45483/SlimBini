ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :calories, :protein, :fat, :carbohydrate, :user_id, :genre_id, :image
   
  form do |f|
    f.inputs "Product Details" do
      f.input :user_id
      f.input :genre_id
      f.input :name
      f.input :description
      f.input :calories
      f.input :protein
      f.input :fat
      f.input :carbohydrate
      f.input :image, as: :file
    end
    f.actions
  end
  
  show do
  attributes_table do
    row :user
    row :name
    row :description
    row :calories
    row :protein
    row :fat
    row :carbohydrate
    row :image do |product|
      image_tag url_for(product.image), size: "200x200" if product.image.attached?
    end
  end
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :calories, :protein, :fat, :carbohydrate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

ActiveAdmin.register Genre do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image
   
  form do |f|
    f.inputs "Genre Details" do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end
  
  index do
  selectable_column
  id_column
  column :name
  column :image do |genre|
    image_tag url_for(genre.image), size: "50x50" if genre.image.attached?
  end
  actions
  end

  
  show do
    attributes_table do
      row :name
      row :image do |genre|
        image_tag url_for(genre.image), size: "100x100" if genre.image.attached?
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

ActiveAdmin.register MenuProduct do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :menu_id, :product_id, :meal_type

  show do
    attributes_table do
      row :user
      row :menu_id
      row :product
      row :meal_type
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :menu_id, :product_id, :meal_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

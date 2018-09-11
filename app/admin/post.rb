ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :body
    column :user

    actions
  end

  controller do
    def scoped_collection
      super.includes(:user)
    end
  end
end

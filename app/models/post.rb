class Post < ActiveRecord::Base
  rails_admin do
    
    list do
      field :title
      field :created_at
    end

    create do
      field :title do
        help 'Please select a Title'
      end

      field :content, :wysihtml5 do
        help 'e.g. Something that got your attention'
      end
    end

    edit do
      field :title do
        help 'Please select a Title'
      end

      field :content, :wysihtml5 do
        help 'e.g. Something that got your attention'
      end
    end
  end
end

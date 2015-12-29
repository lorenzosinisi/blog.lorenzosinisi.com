class About < ActiveRecord::Base
  rails_admin do
    
    list do
      field :title
      field :created_at
    end

    create do
      field :title do
        help 'Please select a Title'
      end
      field :body, :text do
        html_attributes do
          {rows: 20, cols: 70}
        end
      end
    end

    edit do
      field :title do
        help 'Please select a Title'
      end
      field :body, :text do
        html_attributes do
          {rows: 20, cols: 80}
        end
      end
    end
  end

end

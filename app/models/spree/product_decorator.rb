module Spree
  Product.class_eval do
    has_many :comments, class_name: 'Spree::Comment'
  end
end

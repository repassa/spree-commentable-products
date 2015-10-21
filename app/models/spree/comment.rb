module Spree
  class Comment < Spree::Base
    # https://github.com/jackdempsey/acts_as_commentable/blob/master/lib/comment_methods.rb
    include ActsAsCommentable::Comment

    belongs_to :user, class_name: 'Spree::User'
    belongs_to :commentable, polymorphic: true

    validates :body, presence: true

    default_scope { order(created_at: :desc) }
  end
end

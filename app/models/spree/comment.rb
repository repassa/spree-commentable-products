module Spree
  class Comment < Spree::Base
    # https://github.com/jackdempsey/acts_as_commentable/blob/master/lib/comment_methods.rb
    include ActsAsCommentable::Comment

    belongs_to :user, class_name: 'Spree::User'
    belongs_to :product, class_name: 'Spree::Product'
    belongs_to :commentable, polymorphic: true

    has_one :answer, as: :commentable, class_name: 'Spree::Comment'

    validates :user, :body, presence: true
    validates :body, length: { in: 1..140 }
    validates :product, presence: true, unless: 'commentable.present?'

    default_scope { order(created_at: :desc) }

    def is_question?
      commentable.blank?
    end

    def is_answer?
      !is_question?
    end

    def answered?
      is_question? && answer.present?
    end
  end
end

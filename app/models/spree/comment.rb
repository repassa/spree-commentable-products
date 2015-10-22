module Spree
  class Comment < Spree::Base
    # https://github.com/jackdempsey/acts_as_commentable/blob/master/lib/comment_methods.rb
    include ActsAsCommentable::Comment

    belongs_to :user, class_name: 'Spree::User'
    belongs_to :product, class_name: 'Spree::Product'
    belongs_to :commentable, polymorphic: true

    has_one :answer, class_name: 'Spree::Comment'

    validates :user, :body, presence: true
    validates :product, presence: true, if: 'commentable.blank?'

    default_scope { order(created_at: :desc) }

    def is_question?
      # Check if this comment is a question base don the product
      # that this is related. If blank? so this comment is a question
      # not and answer
      product.blank?
    end


    def is_answer?
      # If this is a question, so obviously this isn't an answer
      !is_question?
    end

    def answered?
      # Check if there is an asnwer present if this comment is a question
      if is_question? && answer.present?
        true
      # If is an answer so this method is already answered
      elsif is_answer?
        true
      else
        false
      end
    end
  end
end

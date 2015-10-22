module Spree
  class CommentsController < Spree::StoreController
    def create
      # Spree::StoreController already has authenticaiton methods
      # like you can see here
      # https://github.com/spree/spree/blob/v2.3.1/core/lib/spree/core/controller_helpers/auth.rb#L12
      authorize!(:create, Product)
      @comment      = Spree::Comment.new(permitted_params)
      @comment.user = try_spree_current_user
      # Set the message depending on the state of the .save method
      @comment.save ? (flash[:success] = t('spree.comment.success')) : (flash[:error] = t('spree.comment.failure'))
      redirect_to spree.product_path(@comment.product_id)
    end

    protected

    # Spree::StoreController doesn't have a default permitted_params
    # method to define attributes based on some policy...
    # In this case you need to define it manually
    def permitted_params
      params.require(:comment).permit([:title, :body, :product_id])
    end
  end
end

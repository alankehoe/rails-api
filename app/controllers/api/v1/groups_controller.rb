module Api
  module V1
    # Used to handle all requests around group resources
    #
    class GroupsController < BaseController
      before_action :doorkeeper_authorize!
      before_action :set_instances, only: [:show, :update, :destroy]

      def index
        @groups = current_user.groups.order created_at: :desc
        respond_with @groups
      end

      def show
        respond_with @group
      end

      def create
        @group = Group.create! group_params
        @group.add_owner current_user
        respond_with @group
      end

      def update
        if params[:file]
          @group.avatar = params[:file]
          @group.save!
        else
          @group.update! group_params
        end
        respond_with @group
      end

      def destroy
        @group.destroy!
        respond_with @group
      end

      private

      def set_instances
        errors = []
        @group = Group.find params[:id]
        if request.delete?
          errors.push('You must be the group owner')
          render_forbidden errors unless @group.owner?(current_user)
        else
          errors.push('You are not a member of this group')
          render_forbidden errors unless @group.member?(current_user)
        end
      end

      def group_params
        params.required(:group).permit :name,
                                       :description
      end
    end
  end
end
# == Schema Information
#
# Table name: groups
#
# t.string   "name"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.text     "description"
# t.string   "avatar"
# t.string   "gravatar"
#
class Group < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  include Application::Gravatar

  #
  # Relations
  #
  has_many :memberships
  has_many :users, through: :memberships

  #
  # Hooks
  #
  before_save { self.gravatar = create_url name, s: 400 }

  #
  # Instance Methods
  #

  # used to create a membership
  #
  # @param user[User] the user instance to add to the group
  # @param permission[String] the users permissions in the group
  # @return [Membership] the membership that was just created
  def add_user(user, permission)
    memberships.create! user_id: user.id, permission: permission
  end

  # add an owner to the membership
  #
  # @return [Membership] the membership that was just created
  def add_owner(user)
    add_user user, Membership::OWNER
  end

  # check to see if a user is a member of a group
  #
  # @param user[User] the user instance to try
  # @return [Boolean] is a member or not
  def member?(user)
    users.each do |member|
      return true if member.id == user.id
    end
    false
  end

  # check to see if a user is an owner of a group
  #
  # @param user[User] the user instance to try
  # @return [Boolean] is an owner or not
  def owner?(user)
    memberships.owners.each do |membership|
      return true if membership.user_id == user.id
    end
    false
  end

  # check to see if a user is a manager of a group
  #
  # @param user[User] the user instance to try
  # @return [Boolean] is a manager or not
  def manager?(user)
    memberships.managers.each do |membership|
      return true if membership.user_id == user.id
    end
    false
  end

  # check to see if a user is a reporter of a group
  #
  # @param user[User] the user instance to try
  # @return [Boolean] is a reporter or not
  def reporter?(user)
    memberships.reporters.each do |membership|
      return true if membership.user_id == user.id
    end
    false
  end
end

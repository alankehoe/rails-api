# == Schema Information
#
# Table name: memberships
#
# t.string   "permission"
# t.uuid     "user_id"
# t.uuid     "group_id"
# t.datetime "created_at"
# t.datetime "updated_at"
#
class Membership < ActiveRecord::Base
  #
  # Permissions
  #
  OWNER = 'OWNER'
  MANAGER = 'MANAGER'
  REPORTER = 'REPORTER'

  #
  # Relations
  #
  belongs_to :user
  belongs_to :group

  #
  # Scopes
  #
  scope :owners, -> { where(permission: OWNER) }
  scope :managers, -> { where(permission: MANAGER) }
  scope :reporters, -> { where(permission: REPORTER) }
end

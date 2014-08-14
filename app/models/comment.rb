class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :employee

  default_scope { order ('comments.created_at DESC') }

end

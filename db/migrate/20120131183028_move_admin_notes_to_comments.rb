class MoveAdminNotesToComments < ActiveRecord::Migration
  def self.up
    if ActiveRecord::Base.connection.indexes(:admin_notes).any? { |i| i.columns == %w(admin_user_type admin_user_id) }
      remove_index :admin_notes, :column => [:admin_user_type, :admin_user_id]
    end
    rename_table  :admin_notes, :active_admin_comments
    rename_column :active_admin_comments, :admin_user_type, :author_type
    rename_column :active_admin_comments, :admin_user_id, :author_id
    add_column    :active_admin_comments, :namespace, :string
    add_index     :active_admin_comments, [:namespace]
    add_index     :active_admin_comments, [:author_type, :author_id]

    # Update all the existing comments to the default namespace
    say "Updating any existing comments to the #{ActiveAdmin.application.default_namespace} namespace."
    execute "UPDATE active_admin_comments SET namespace='#{ActiveAdmin.application.default_namespace}'"
  end

  def self.down
    remove_index  :active_admin_comments, :column => [:author_type, :author_id]
    remove_index  :active_admin_comments, :column => [:namespace]
    remove_column :active_admin_comments, :namespace
    rename_column :active_admin_comments, :author_id, :admin_user_id
    rename_column :active_admin_comments, :author_type, :admin_user_type
    rename_table  :active_admin_comments, :admin_notes
    add_index     :admin_notes, [:admin_user_type, :admin_user_id]
  end
end

# class MoveAdminNotesToComments < ActiveRecord::Migration
#   def self.up
#     # --- Helpers ---
#     conn = ActiveRecord::Base.connection
#
#     def self.index_exists_on?(table, columns)
#       ActiveRecord::Base.connection.indexes(table).any? do |i|
#         i.columns == Array(columns).map(&:to_s)
#       end
#     end
#
#     # --- Remove old index if it exists ---
#     if table_exists?(:admin_notes)
#       if index_exists_on?(:admin_notes, [:admin_user_type, :admin_user_id])
#         remove_index :admin_notes, :column => [:admin_user_type, :admin_user_id]
#       end
#     end
#
#     # --- Table may or may not exist (fresh DB skips this migration entirely) ---
#     if table_exists?(:admin_notes)
#       rename_table :admin_notes, :active_admin_comments
#     end
#
#     if table_exists?(:active_admin_comments)
#       if column_exists?(:active_admin_comments, :admin_user_type)
#         rename_column :active_admin_comments, :admin_user_type, :author_type
#       end
#
#       if column_exists?(:active_admin_comments, :admin_user_id)
#         rename_column :active_admin_comments, :admin_user_id, :author_id
#       end
#
#       unless column_exists?(:active_admin_comments, :namespace)
#         add_column :active_admin_comments, :namespace, :string
#       end
#
#       unless index_exists_on?(:active_admin_comments, :namespace)
#         add_index :active_admin_comments, [:namespace]
#       end
#
#       unless index_exists_on?(:active_admin_comments, [:author_type, :author_id])
#         add_index :active_admin_comments, [:author_type, :author_id]
#       end
#
#       # Safe update if column exists
#       if column_exists?(:active_admin_comments, :namespace)
#         namespace = ActiveAdmin.application.default_namespace
#         execute "UPDATE active_admin_comments SET namespace='#{namespace}' WHERE namespace IS NULL"
#       end
#     end
#   end
#
#   def self.down
#     def self.index_exists_on?(table, columns)
#       ActiveRecord::Base.connection.indexes(table).any? do |i|
#         i.columns == Array(columns).map(&:to_s)
#       end
#     end
#
#     if table_exists?(:active_admin_comments)
#       if index_exists_on?(:active_admin_comments, [:author_type, :author_id])
#         remove_index :active_admin_comments, :column => [:author_type, :author_id]
#       end
#
#       if index_exists_on?(:active_admin_comments, :namespace)
#         remove_index :active_admin_comments, :column => [:namespace]
#       end
#
#       if column_exists?(:active_admin_comments, :namespace)
#         remove_column :active_admin_comments, :namespace
#       end
#
#       if column_exists?(:active_admin_comments, :author_id)
#         rename_column :active_admin_comments, :author_id, :admin_user_id
#       end
#
#       if column_exists?(:active_admin_comments, :author_type)
#         rename_column :active_admin_comments, :author_type, :admin_user_type
#       end
#
#       rename_table :active_admin_comments, :admin_notes
#     end
#
#     # Recreate original index if needed
#     if table_exists?(:admin_notes)
#       unless index_exists_on?(:admin_notes, [:admin_user_type, :admin_user_id])
#         add_index :admin_notes, [:admin_user_type, :admin_user_id]
#       end
#     end
#   end
# end

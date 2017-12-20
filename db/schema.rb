# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171219135714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "action"
    t.integer "targetable_id"
    t.string "targetable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["targetable_type", "targetable_id"], name: "index_activities_on_targetable_type_and_targetable_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "admin_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_admin_requests_on_project_id"
    t.index ["user_id"], name: "index_admin_requests_on_user_id"
  end

  create_table "apply_requests", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "request_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "accepted_at"
    t.datetime "rejected_at"
  end

  create_table "assignments", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.boolean "free"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.datetime "confirmed_at"
    t.boolean "invitation_sent"
    t.integer "project_id"
    t.index ["task_id", "user_id"], name: "index_assignments_on_task_id_and_user_id"
  end

  create_table "badges", id: :serial, force: :cascade do |t|
    t.integer "badge_type"
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_badges_on_project_id"
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "balances", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.integer "amount", default: 0
    t.integer "funded", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", id: :serial, force: :cascade do |t|
    t.string "acct_id"
    t.integer "status"
    t.string "last4"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "boards", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_boards_on_deleted_at"
    t.index ["project_id"], name: "index_boards_on_project_id"
  end

  create_table "btc_exchange_rates", id: :serial, force: :cascade do |t|
    t.decimal "rate", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "change_leader_invitations", id: :serial, force: :cascade do |t|
    t.string "new_leader"
    t.datetime "sent_at"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.string "project_id"
  end

  create_table "charges", force: :cascade do |t|
    t.integer "created"
    t.boolean "paid", default: false
    t.integer "amount", default: 0
    t.string "currency", default: "usd"
    t.boolean "refunded", default: false
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", id: :serial, force: :cascade do |t|
    t.string "chat_rooms"
    t.string "room_id"
    t.string "string"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_chat_rooms_on_project_id"
  end

  create_table "chat_sessions", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.string "status"
    t.integer "requester_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_chat_sessions_on_receiver_id"
    t.index ["requester_id"], name: "index_chat_sessions_on_requester_id"
    t.index ["uuid"], name: "index_chat_sessions_on_uuid"
  end

  create_table "chatrooms", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chatroom_type"
    t.index ["project_id"], name: "index_chatrooms_on_project_id"
  end

  create_table "conversations", id: :serial, force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", id: :serial, force: :cascade do |t|
    t.string "card_id"
    t.integer "status"
    t.string "last4"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "custom_accounts", id: :serial, force: :cascade do |t|
    t.string "acc_id"
    t.integer "status", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "withdrawals_enabled", default: true
    t.index ["user_id"], name: "index_custom_accounts_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "discussions", id: :serial, force: :cascade do |t|
    t.integer "discussable_id"
    t.string "discussable_type"
    t.integer "user_id"
    t.string "field_name"
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussable_type", "discussable_id"], name: "index_discussions_on_discussable_type_and_discussable_id"
  end

  create_table "do_for_frees", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "application"
  end

  create_table "do_requests", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.string "state"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "application"
    t.boolean "free"
    t.integer "project_id"
    t.index ["task_id", "user_id"], name: "index_do_requests_on_task_id_and_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "generate_addresses", id: :serial, force: :cascade do |t|
    t.string "sender_address"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wallet_id"
    t.string "receiver_address"
    t.string "pass_phrase"
  end

  create_table "group_messages", id: :serial, force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.integer "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["chatroom_id"], name: "index_group_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_group_messages_on_user_id"
  end

  create_table "groupmembers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_groupmembers_on_chatroom_id"
    t.index ["user_id"], name: "index_groupmembers_on_user_id"
  end

  create_table "hold_balances", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hold_balances_on_user_id"
  end

  create_table "institution_users", id: :serial, force: :cascade do |t|
    t.integer "institution_id"
    t.integer "user_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_institution_users_on_institution_id"
    t.index ["user_id"], name: "index_institution_users_on_user_id"
  end

  create_table "institutions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "country"
    t.string "city"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "log_custom_accounts", id: :serial, force: :cascade do |t|
    t.string "acct_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.boolean "read", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "action", default: 0
    t.integer "source_model_id"
    t.string "source_model_type"
    t.integer "origin_user_id"
    t.boolean "read", default: false
    t.integer "action_type"
    t.index ["source_model_type", "source_model_id"], name: "index_notifications_on_source_model_type_and_source_model_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payment_transactions", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.integer "amount"
    t.integer "status"
    t.integer "payment_type"
    t.string "payment_provider"
    t.string "payment_token"
    t.integer "processing_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_payment_transactions_on_task_id"
    t.index ["user_id"], name: "index_payment_transactions_on_user_id"
  end

  create_table "payout_details", id: :serial, force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.text "address"
    t.string "postal_code"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.integer "ssn"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "legal_document"
    t.string "last_4_ssn"
    t.index ["user_id"], name: "index_payout_details_on_user_id"
  end

  create_table "payout_transactions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "payout_provider"
    t.string "target_account"
    t.string "transaction_id"
    t.integer "status"
    t.integer "amount"
    t.integer "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payout_id"
    t.index ["user_id"], name: "index_payout_transactions_on_user_id"
  end

  create_table "plans", id: :serial, force: :cascade do |t|
    t.text "notes"
    t.text "todos"
    t.string "owner"
    t.string "status"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_comments", id: :serial, force: :cascade do |t|
    t.integer "commenter_id"
    t.integer "receiver_id"
    t.text "comment_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commenter_id"], name: "index_profile_comments_on_commenter_id"
    t.index ["receiver_id"], name: "index_profile_comments_on_receiver_id"
  end

  create_table "proj_admins", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
  end

  create_table "project_comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_project_comments_on_deleted_at"
  end

  create_table "project_edits", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state", default: "pending"
    t.integer "user_id"
    t.integer "project_id"
    t.text "description"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_project_edits_on_deleted_at"
  end

  create_table "project_rates", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "rate", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_users", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "country"
    t.string "picture"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "expires_at"
    t.integer "volunteers", default: 0
    t.string "state"
    t.text "request_description"
    t.string "short_description"
    t.string "video_id"
    t.string "wiki_page_name"
    t.boolean "is_approval_enabled", default: false
    t.text "full_description"
    t.boolean "hidden", default: false
    t.integer "parent_id"
    t.string "slug"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "section_details", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "parent_id"
    t.integer "order"
    t.string "title", default: ""
    t.text "context", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_section_details_on_project_id"
  end

  create_table "task_attachments", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "task_comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
  end

  create_table "task_members", id: :serial, force: :cascade do |t|
    t.integer "team_membership_id"
    t.integer "task_id"
    t.datetime "created_at"
    t.index ["task_id"], name: "index_task_members_on_task_id"
    t.index ["team_membership_id"], name: "index_task_members_on_team_membership_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deadline"
    t.integer "user_id"
    t.text "condition_of_execution"
    t.string "fileone"
    t.string "filetwo"
    t.string "filethree"
    t.string "filefour"
    t.string "filefive"
    t.string "state"
    t.integer "number_of_participants", default: 0
    t.integer "target_number_of_participants", default: 0
    t.boolean "assigned", default: false
    t.text "proof_of_execution"
    t.text "short_description"
    t.boolean "marker", default: false
    t.datetime "deleted_at"
    t.boolean "free", default: false
    t.integer "board_id"
    t.integer "budget"
    t.integer "priority"
    t.index ["board_id"], name: "index_tasks_on_board_id"
    t.index ["deleted_at"], name: "index_tasks_on_deleted_at"
  end

  create_table "team_memberships", id: :serial, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "team_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.datetime "deleted_at"
    t.text "deleted_reason"
    t.index ["deleted_at"], name: "index_team_memberships_on_deleted_at"
    t.index ["team_id", "team_member_id", "role"], name: "team_membership_team_member_role_index"
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["team_member_id"], name: "index_team_memberships_on_team_member_id"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "transaction_histories", id: :serial, force: :cascade do |t|
    t.integer "entity"
    t.integer "entity_balance"
    t.string "operation_type"
    t.integer "source_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tran_record_id"
    t.string "tran_record_type"
    t.string "source_type"
    t.index ["tran_record_type", "tran_record_id"], name: "index_for_transaction_histroy"
  end

  create_table "user_message_read_flags", id: :serial, force: :cascade do |t|
    t.boolean "read_status", default: false
    t.integer "user_id"
    t.integer "group_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_message_id"], name: "index_user_message_read_flags_on_group_message_id"
    t.index ["user_id", "group_message_id"], name: "index_user_message_read_flags_on_user_id_and_group_message_id", unique: true
    t.index ["user_id"], name: "index_user_message_read_flags_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "country"
    t.text "description"
    t.string "picture"
    t.string "company"
    t.boolean "admin", default: false
    t.string "first_link"
    t.string "second_link"
    t.string "third_link"
    t.string "city"
    t.string "fourth_link"
    t.string "phone_number", limit: 15
    t.text "bio"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "linkedin_url"
    t.string "chat_token"
    t.string "guid"
    t.string "provider"
    t.string "uid"
    t.integer "test_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username"
    t.string "stripe_customer_id"
    t.string "background_picture"
    t.string "first_name"
    t.string "last_name"
    t.string "state"
    t.string "skype_id"
    t.string "facebook_id"
    t.string "linkedin_id"
    t.string "twitter_id"
    t.boolean "hidden", default: false
    t.datetime "last_seen_at"
    t.string "preferred_language", default: "en"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wikis", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "project_id"
    t.string "pictureone"
    t.string "picturetwo"
    t.string "picturethree"
    t.string "picturefour"
    t.string "picturefive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "state"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_wikis_on_deleted_at"
  end

  create_table "work_records", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admin_requests", "projects"
  add_foreign_key "admin_requests", "users"
  add_foreign_key "badges", "projects"
  add_foreign_key "badges", "users"
  add_foreign_key "boards", "projects"
  add_foreign_key "chat_rooms", "projects"
  add_foreign_key "custom_accounts", "users"
  add_foreign_key "group_messages", "chatrooms"
  add_foreign_key "group_messages", "users"
  add_foreign_key "groupmembers", "chatrooms"
  add_foreign_key "groupmembers", "users"
  add_foreign_key "hold_balances", "users"
  add_foreign_key "institution_users", "institutions"
  add_foreign_key "institution_users", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "origin_user_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "payment_transactions", "tasks"
  add_foreign_key "payment_transactions", "users"
  add_foreign_key "payout_details", "users"
  add_foreign_key "payout_transactions", "users"
  add_foreign_key "section_details", "projects"
  add_foreign_key "task_members", "tasks"
  add_foreign_key "task_members", "team_memberships"
  add_foreign_key "tasks", "boards"
  add_foreign_key "user_message_read_flags", "group_messages"
  add_foreign_key "user_message_read_flags", "users"
end

# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "auth_group", :force => true do |t|
    t.string "name", :limit => 80, :default => "", :null => false
  end

  add_index "auth_group", ["name"], :name => "name", :unique => true

  create_table "auth_group_permissions", :force => true do |t|
    t.integer "group_id",      :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], :name => "group_id", :unique => true
  add_index "auth_group_permissions", ["permission_id"], :name => "permission_id_refs_id_5886d21f"

  create_table "auth_message", :force => true do |t|
    t.integer "user_id",                       :null => false
    t.text    "message", :limit => 2147483647, :null => false
  end

  add_index "auth_message", ["user_id"], :name => "auth_message_user_id"

  create_table "auth_permission", :force => true do |t|
    t.string  "name",            :limit => 50,  :default => "", :null => false
    t.integer "content_type_id",                                :null => false
    t.string  "codename",        :limit => 100, :default => "", :null => false
  end

  add_index "auth_permission", ["content_type_id", "codename"], :name => "content_type_id", :unique => true
  add_index "auth_permission", ["content_type_id"], :name => "auth_permission_content_type_id"

  create_table "auth_user", :force => true do |t|
    t.string   "username",     :limit => 30,  :default => "", :null => false
    t.string   "first_name",   :limit => 30,  :default => "", :null => false
    t.string   "last_name",    :limit => 30,  :default => "", :null => false
    t.string   "email",        :limit => 75,  :default => "", :null => false
    t.string   "password",     :limit => 128, :default => "", :null => false
    t.boolean  "is_staff",                                    :null => false
    t.boolean  "is_active",                                   :null => false
    t.boolean  "is_superuser",                                :null => false
    t.datetime "last_login",                                  :null => false
    t.datetime "date_joined",                                 :null => false
  end

  add_index "auth_user", ["username"], :name => "username", :unique => true

  create_table "auth_user_groups", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  add_index "auth_user_groups", ["group_id"], :name => "group_id_refs_id_f116770"
  add_index "auth_user_groups", ["user_id", "group_id"], :name => "user_id", :unique => true

  create_table "auth_user_user_permissions", :force => true do |t|
    t.integer "user_id",       :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_user_user_permissions", ["permission_id"], :name => "permission_id_refs_id_67e79cb"
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], :name => "user_id", :unique => true

  create_table "car_character", :force => true do |t|
    t.string  "name",       :limit => 200,        :default => "", :null => false
    t.string  "image_name", :limit => 200,        :default => "", :null => false
    t.string  "photo_name", :limit => 200,        :default => "", :null => false
    t.text    "content",    :limit => 2147483647,                 :null => false
    t.integer "current",                                          :null => false
  end

  create_table "car_characters", :force => true do |t|
    t.string  "name",       :default => "", :null => false
    t.string  "image_name", :default => "", :null => false
    t.string  "photo_name", :default => "", :null => false
    t.text    "content",                    :null => false
    t.integer "current",    :default => 1,  :null => false
  end

  create_table "car_comic", :force => true do |t|
    t.string  "title"
    t.date    "pub_date",    :null => false
    t.text    "content"
    t.integer "episode"
    t.integer "panels",      :null => false
    t.string  "music"
    t.string  "music_title"
  end

  add_index "car_comic", ["pub_date"], :name => "date", :unique => true

  create_table "car_comic_characters", :force => true do |t|
    t.integer "comic_id",     :null => false
    t.integer "character_id", :null => false
  end

  add_index "car_comic_characters", ["character_id"], :name => "character_id_refs_id_4c8b4c83"
  add_index "car_comic_characters", ["comic_id", "character_id"], :name => "comic_id", :unique => true

  create_table "car_comicscharacters_link", :force => true do |t|
    t.integer "comic_id",     :null => false
    t.integer "character_id", :null => false
  end

  create_table "car_comment", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "content"
    t.datetime "pub_date",                               :null => false
    t.integer  "comic_id",               :default => 0,  :null => false
    t.integer  "enabled",                :default => 1,  :null => false
    t.string   "ip",       :limit => 15, :default => "", :null => false
  end

  create_table "car_comments", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "content"
    t.datetime "pub_date",                               :null => false
    t.integer  "comic_id",               :default => 0,  :null => false
    t.integer  "enabled",                :default => 1,  :null => false
    t.string   "ip",       :limit => 15, :default => "", :null => false
  end

  create_table "comics", :primary_key => "cid", :force => true do |t|
    t.string  "title",    :limit => 50, :default => "", :null => false
    t.string  "filename", :limit => 80, :default => "", :null => false
    t.integer "date",                   :default => 0,  :null => false
  end

  create_table "comics_comic", :force => true do |t|
    t.string  "title",       :limit => 200
    t.date    "pub_date",                          :null => false
    t.text    "content",     :limit => 2147483647
    t.integer "episode"
    t.integer "panels",                            :null => false
    t.string  "music",       :limit => 200
    t.string  "music_title", :limit => 200
  end

  add_index "comics_comic", ["pub_date"], :name => "date", :unique => true

  create_table "config", :primary_key => "option", :force => true do |t|
    t.string "value",       :limit => 100, :default => "", :null => false
    t.string "name",        :limit => 100, :default => "", :null => false
    t.string "description", :limit => 200, :default => "", :null => false
  end

  create_table "deadwinter_character", :force => true do |t|
    t.integer "order",                                             :null => false
    t.string  "slug",        :limit => 32,         :default => "", :null => false
    t.string  "name",        :limit => 100,        :default => "", :null => false
    t.string  "thumbnail",   :limit => 100,        :default => "", :null => false
    t.string  "background",  :limit => 100,        :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.string  "birthplace",  :limit => 100,        :default => "", :null => false
    t.string  "blood_type",  :limit => 100,        :default => "", :null => false
  end

  create_table "deadwinter_comic", :force => true do |t|
    t.string  "strip",           :limit => 100,        :default => "", :null => false
    t.text    "title",           :limit => 2147483647,                 :null => false
    t.date    "pub_date",                                              :null => false
    t.text    "content",         :limit => 2147483647,                 :null => false
    t.text    "rss_description", :limit => 2147483647,                 :null => false
    t.integer "page",                                                  :null => false
    t.string  "medium",          :limit => 5,          :default => "", :null => false
    t.string  "thumbnail",       :limit => 100,        :default => "", :null => false
  end

  create_table "deadwinter_guestcomic", :force => true do |t|
    t.text   "content",         :limit => 2147483647,                 :null => false
    t.text   "title",           :limit => 2147483647,                 :null => false
    t.text   "rss_description", :limit => 2147483647,                 :null => false
    t.date   "pub_date",                                              :null => false
    t.string "slug",            :limit => 32,         :default => "", :null => false
    t.string "strip",           :limit => 100,        :default => "", :null => false
    t.string "thumbnail",       :limit => 100,        :default => "", :null => false
  end

  add_index "deadwinter_guestcomic", ["slug"], :name => "slug", :unique => true

  create_table "deadwinter_link", :force => true do |t|
    t.integer "order",                                    :null => false
    t.string  "title",     :limit => 100, :default => "", :null => false
    t.string  "image",     :limit => 100, :default => "", :null => false
    t.string  "url",       :limit => 200, :default => "", :null => false
    t.boolean "published",                                :null => false
  end

  create_table "deadwinter_newspost", :force => true do |t|
    t.text    "content",   :limit => 2147483647, :null => false
    t.date    "pub_date",                        :null => false
    t.boolean "published",                       :null => false
  end

  create_table "deadwinter_othercomic", :force => true do |t|
    t.string "slug",      :limit => 32,  :default => "", :null => false
    t.string "thumbnail", :limit => 100, :default => "", :null => false
    t.date   "pub_date",                                 :null => false
    t.string "url",       :limit => 300, :default => "", :null => false
  end

  add_index "deadwinter_othercomic", ["slug"], :name => "slug", :unique => true

  create_table "deadwinter_product", :force => true do |t|
    t.integer "order",                                             :null => false
    t.string  "title",       :limit => 100,        :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.float   "price",                                             :null => false
    t.string  "image",       :limit => 100,        :default => "", :null => false
    t.string  "image_link",  :limit => 100,        :default => "", :null => false
    t.integer "layout",                                            :null => false
    t.text    "code",        :limit => 2147483647,                 :null => false
    t.boolean "published",                                         :null => false
  end

  create_table "deadwinter_product_sizes", :force => true do |t|
    t.integer "product_id",   :null => false
    t.integer "shirtsize_id", :null => false
  end

  add_index "deadwinter_product_sizes", ["product_id", "shirtsize_id"], :name => "product_id", :unique => true
  add_index "deadwinter_product_sizes", ["shirtsize_id"], :name => "shirtsize_id_refs_id_32556cf0"

  create_table "deadwinter_shirtsize", :force => true do |t|
    t.integer "order",                                :null => false
    t.string  "name",  :limit => 100, :default => "", :null => false
    t.string  "value", :limit => 32,  :default => "", :null => false
  end

  create_table "demographics", :force => true do |t|
    t.string    "value", :default => "", :null => false
    t.timestamp "date",                  :null => false
  end

  create_table "django_admin_log", :force => true do |t|
    t.datetime "action_time",                                           :null => false
    t.integer  "user_id",                                               :null => false
    t.integer  "content_type_id"
    t.text     "object_id",       :limit => 2147483647
    t.string   "object_repr",     :limit => 200,        :default => "", :null => false
    t.integer  "action_flag",     :limit => 2,                          :null => false
    t.text     "change_message",  :limit => 2147483647,                 :null => false
  end

  add_index "django_admin_log", ["content_type_id"], :name => "django_admin_log_content_type_id"
  add_index "django_admin_log", ["user_id"], :name => "django_admin_log_user_id"

  create_table "django_content_type", :force => true do |t|
    t.string "name",      :limit => 100, :default => "", :null => false
    t.string "app_label", :limit => 100, :default => "", :null => false
    t.string "model",     :limit => 100, :default => "", :null => false
  end

  add_index "django_content_type", ["app_label", "model"], :name => "app_label", :unique => true

  create_table "django_session", :primary_key => "session_key", :force => true do |t|
    t.text     "session_data", :limit => 2147483647, :null => false
    t.datetime "expire_date",                        :null => false
  end

  create_table "django_site", :force => true do |t|
    t.string "domain", :limit => 100, :default => "", :null => false
    t.string "name",   :limit => 50,  :default => "", :null => false
  end

  create_table "guestbook", :force => true do |t|
    t.string   "email",   :limit => 32, :default => "noemail@test.com", :null => false
    t.text     "comment"
    t.datetime "created",                                               :null => false
  end

  add_index "guestbook", ["id"], :name => "id"

  create_table "news", :force => true do |t|
    t.string  "title",    :limit => 100, :default => "", :null => false
    t.integer "date",                    :default => 0,  :null => false
    t.string  "username", :limit => 50,  :default => "", :null => false
    t.text    "content",                                 :null => false
  end

  create_table "polls_choice", :force => true do |t|
    t.integer "poll_id",                                :null => false
    t.string  "choice",  :limit => 200, :default => "", :null => false
    t.integer "votes",                                  :null => false
  end

  add_index "polls_choice", ["poll_id"], :name => "polls_choice_poll_id"

  create_table "polls_poll", :force => true do |t|
    t.string   "question", :limit => 200, :default => "", :null => false
    t.datetime "pub_date",                                :null => false
  end

  create_table "portfolio_entry", :force => true do |t|
    t.string  "name",        :default => "", :null => false
    t.string  "url",         :default => "", :null => false
    t.string  "image",       :default => "", :null => false
    t.string  "thumb1"
    t.string  "thumb2"
    t.string  "thumb3"
    t.text    "description"
    t.date    "pub_date",                    :null => false
    t.integer "section_id",                  :null => false
  end

  create_table "portfolio_section", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "url_3", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_4", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_5", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_7", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_8", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_9", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_a", :force => true do |t|
  end

  create_table "url_b", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_c", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_d", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_e", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_f", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_g", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_m", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_p", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_q", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_s", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_t", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_v", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "url_x", :force => true do |t|
    t.text   "url",                       :null => false
    t.string "short_url", :default => "", :null => false
    t.date   "created",                   :null => false
  end

  create_table "users", :primary_key => "uid", :force => true do |t|
    t.string "username", :limit => 50, :default => "", :null => false
    t.string "password", :limit => 32, :default => "", :null => false
    t.string "email",    :limit => 80, :default => "", :null => false
  end

  create_table "wp_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",                     :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 20,  :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wp_comments", ["comment_approved", "comment_date_gmt"], :name => "comment_approved_date_gmt"
  add_index "wp_comments", ["comment_approved"], :name => "comment_approved"
  add_index "wp_comments", ["comment_date_gmt"], :name => "comment_date_gmt"
  add_index "wp_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wp_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.integer  "link_category",    :limit => 8,        :default => 0,   :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 20,       :default => "Y", :null => false
    t.integer  "link_owner",                           :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wp_links", ["link_category"], :name => "link_category"
  add_index "wp_links", ["link_visible"], :name => "link_visible"

  create_table "wp_options", :id => false, :force => true do |t|
    t.integer "option_id",    :limit => 8,                             :null => false
    t.integer "blog_id",                            :default => 0,     :null => false
    t.string  "option_name",  :limit => 64,         :default => "",    :null => false
    t.text    "option_value", :limit => 2147483647,                    :null => false
    t.string  "autoload",     :limit => 20,         :default => "yes", :null => false
  end

  add_index "wp_options", ["option_name"], :name => "option_name"

  create_table "wp_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_postmeta", ["meta_key"], :name => "meta_key"
  add_index "wp_postmeta", ["post_id"], :name => "post_id"

  create_table "wp_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.integer  "post_category",                               :default => 0,         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 20,         :default => "publish", :null => false
    t.string   "comment_status",        :limit => 20,         :default => "open",    :null => false
    t.string   "ping_status",           :limit => 20,         :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered",                                              :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wp_posts", ["post_name"], :name => "post_name"
  add_index "wp_posts", ["post_parent"], :name => "post_parent"
  add_index "wp_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wp_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
    t.integer "term_order",                    :default => 0, :null => false
  end

  add_index "wp_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wp_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wp_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wp_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 200, :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wp_terms", ["name"], :name => "name"
  add_index "wp_terms", ["slug"], :name => "slug", :unique => true

  create_table "wp_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_usermeta", ["meta_key"], :name => "meta_key"
  add_index "wp_usermeta", ["user_id"], :name => "user_id"

  create_table "wp_users", :primary_key => "ID", :force => true do |t|
    t.string   "user_login",          :limit => 60,  :default => "", :null => false
    t.string   "user_pass",           :limit => 64,  :default => "", :null => false
    t.string   "user_nicename",       :limit => 50,  :default => "", :null => false
    t.string   "user_email",          :limit => 100, :default => "", :null => false
    t.string   "user_url",            :limit => 100, :default => "", :null => false
    t.datetime "user_registered",                                    :null => false
    t.string   "user_activation_key", :limit => 60,  :default => "", :null => false
    t.integer  "user_status",                        :default => 0,  :null => false
    t.string   "display_name",        :limit => 250, :default => "", :null => false
  end

  add_index "wp_users", ["user_login"], :name => "user_login_key"
  add_index "wp_users", ["user_nicename"], :name => "user_nicename"

end

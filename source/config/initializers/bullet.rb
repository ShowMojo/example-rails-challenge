# frozen_string_literal: true

if Rails.env.development?
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end
end

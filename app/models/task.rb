class Task < ApplicationRecord
  validates :task_name, :description, presence: true
  private
  def set_default_expired
    self.expired_at = Time.now if expired_at.blank?
  end
end

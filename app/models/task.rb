class Task < ApplicationRecord
  belongs_to :list

  scope :not_completed, -> { where(completed: false) }

  before_validation :set_defaults
  after_commit :broadcast_changes, unless: :destroyed?
  after_destroy_commit :broadcast_destroy

  validates :title, presence: true
  validates :due_at, presence: true

  def as_json(options = nil)
    { id:, title:, completed:, position: }
  end

  private

  def set_defaults
    self.due_at ||= Date.current
    self.position ||= (list&.tasks&.maximum(:position) || 0) + 1
  end

  def broadcast_changes
    Turbo::StreamsChannel.broadcast_update_to(
      list,
      target: "task_list",
      partial: "tasks/list",
      locals: { list:, highlight_task_id: (id if previously_new_record? || saved_change_to_title? || saved_change_to_position?) }
    )
  end

  def broadcast_destroy
    Turbo::StreamsChannel.broadcast_update_to(
      list,
      target: "task_list",
      partial: "tasks/list",
      locals: { list: }
    )
  end
end

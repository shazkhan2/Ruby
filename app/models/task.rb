class Task < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true
    validates :due_date, presence: true
    enum status: { pending: 'pending', in_progress: 'in_progress', complete: 'complete'}

    scope :for_user, -> (user) { where(user:user) }
    scope :for_admin, -> { all }

    def self.fetch_tasks(user, selected_user = nil)
        return for_user(user) unless user.admin?
        selected_user ? for_user(selected_user) : for_admin

    end
end

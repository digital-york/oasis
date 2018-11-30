module Hyrax
  module Workflow
    class ChangesRequiredNotification < AbstractNotification
      private

        def subject
          I18n.t('hyrax.notifications.workflow.changes_required.subject')
        end

        def message
          I18n.t('hyrax.notifications.workflow.changes_required.message', title: document.title_of_summary,
                                                                          link: (link_to work_id, document_url),
                                                                          comment: comment)
        end

        def users_to_notify
          user_key = document.depositor
          super << ::User.find_by(email: user_key)
        end
    end
  end
end

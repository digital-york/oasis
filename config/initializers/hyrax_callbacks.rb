# These events are triggered by actions within Hyrax Actors
Hyrax.config.callback.set(:after_create_concern) do |curation_concern, user|
    DownloaderPostDepositJob.perform_later(curation_concern, user)
end

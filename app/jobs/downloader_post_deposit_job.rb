class DownloaderPostDepositJob < ContentEventJob
    def action
        # update Downloader's id
        if repo_object.class.to_s=='Downloader'
            repo_object.summary_id = repo_object.parent_summary_id unless repo_object.parent_summary_id.nil?
            repo_object.save
        end
    end
end

class OtherVersions
    def self.get_other_versions(summary_id)
        solr_query = "has_model_ssim:Summary and id:#{summary_id}"
        SolrHelper.query_result_docs(solr_query)
    end

end

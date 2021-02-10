module FileSetHelper

    # return parent summary docs
    def self.get_parent_summary_docs(fileset_id)
        solr_query = "has_model_ssim:Summary and file_set_ids_ssim:#{fileset_id}"
        SolrHelper.query_result_docs(solr_query)
    end

end

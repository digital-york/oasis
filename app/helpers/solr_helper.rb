require 'figaro'

module SolrHelper
    SOLR = Figaro.env.solr_url

    # return Solr query response
    def self.query(q)
        solr = RSolr.connect :url => SOLR
        response = solr.get 'select', :params => {
            :q=>"#{q}",
            :start=>0,
            :rows=>2147483647
        }
        response
    end

    # return solr query result docs
    def self.query_result_docs(q)
        response = self.query(q)

        if response['response']['numFound'] == 0
            return nil
        else
            return response['response']['docs']
        end
    end

end
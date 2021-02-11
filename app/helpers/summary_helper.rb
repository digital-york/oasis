module SummaryHelper

    # return journal
    # Usage: s = FileSetHelper.get_parent_summary_docs('2514nk481')
    #        SummaryHelper.get_journal(s)
    def self.get_journals(summary_docs)
        journals = []
        summary_docs.each do |summary_doc|
            unless summary_doc['publication_journal_name_label_tesim'].blank?
                summary_doc['publication_journal_name_label_tesim'].each do |j|
                    journals << j unless journals.include? j
                end
            end
        end
        journals
    end

end

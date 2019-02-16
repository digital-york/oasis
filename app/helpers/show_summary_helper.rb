# ShowSumamryHellper define handy methods such as check fields aviabaility
module ShowSummaryHelper
  def self.study_details?(presenter)
    (presenter.solr_document._source['participants_type_of_instruction_tesim'].nil? ||
      presenter.solr_document._source['participants_type_of_instruction_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_amount_of_instruction_tesim'].nil? ||
      presenter.solr_document._source['participants_amount_of_instruction_tesim'][0] == '') &&
    (presenter.solr_document._source['summary_linguistictarget_tesim'].nil? ||
      presenter.solr_document._source['summary_linguistictarget_tesim'][0] == '')
  end

  def self.participant_details?(presenter)
    (presenter.solr_document._source['participants_firstlanguage_tesim'].nil? ||
      presenter.solr_document._source['participants_firstlanguage_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_proficiency_tesim'].nil? ||
      presenter.solr_document._source['participants_proficiency_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_gender_tesim'].nil? ||
      presenter.solr_document._source['participants_gender_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_age_of_learners_of_arrival_tesim'].nil? ||
      presenter.solr_document._source['participants_age_of_learners_of_arrival_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_length_of_residence_tesim'].nil? ||
      presenter.solr_document._source['participants_length_of_residence_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_time_spent_using_l2_tesim'].nil? ||
      presenter.solr_document._source['participants_time_spent_using_l2_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_domain_of_use_tesim'].nil? ||
      presenter.solr_document._source['participants_domain_of_use_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_year_of_teaching_experience_tesim'].nil? ||
      presenter.solr_document._source['participants_year_of_teaching_experience_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_amount_of_prior_instruction_tesim'].nil? ||
      presenter.solr_document._source['participants_amount_of_prior_instruction_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_country_tesim'].nil? ||
      presenter.solr_document._source['participants_country_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_subnational_region_tesim'].nil? ||
      presenter.solr_document._source['participants_subnational_region_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_educational_stage_tesim'].nil? ||
      presenter.solr_document._source['participants_educational_stage_tesim'][0] == '') &&
    (presenter.solr_document._source['participants_institutional_characteristics_tesim'].nil? ||
      presenter.solr_document._source['participants_institutional_characteristics_tesim'][0] == '')
  end
end

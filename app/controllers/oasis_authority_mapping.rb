# This class defines a mapping between local authority files to solr fields
class OasisAuthorityMapping
  @@authority_mapping_filename2solr = {
      "domains_of_use"               => "participants_domain_of_use",
      "first_language_of_learners" => "participants_firstlanguage",
      "gender_of_learners"          => "participants_gender",
      "journals"                     => "publication_journal_name",
      "language_features"           => "summary_linguistictarget",
      "languages_being_learned"    => "participants_targetlanguage",
      "age_of_learners"         => "participants_age",
      "oasis_licences"               => "licence",
      "of_likely_interest_to"       => "of_likely_interest_to",
      "participant_types"            => "participants_type",
      "proficiency_of_learners"     => "participants_proficiency",
      "research_areas"               => "summary_general_research_area"
  }

  def self.authority_mapping_filename2solr
    @@authority_mapping_filename2solr
  end

  def self.authority_mapping_solr2filename
    @@authority_mapping_filename2solr.invert
  end

end

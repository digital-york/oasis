class CatalogController < ApplicationController
  include Hydra::Catalog
  include Hydra::Controller::ControllerBehavior

  # This filter applies the hydra access controls
  before_action :enforce_show_permissions, only: :show

  def self.uploaded_field
    solr_name('system_create', :stored_sortable, type: :date)
  end

  def self.modified_field
    solr_name('system_modified', :stored_sortable, type: :date)
  end

  configure_blacklight do |config|
    config.view.gallery.partials = [:index_header, :index]
    config.view.masonry.partials = [:index]
    config.view.slideshow.partials = [:index]


    config.show.tile_source_field = :content_metadata_image_iiif_info_ssm
    config.show.partials.insert(1, :openseadragon)
    config.search_builder_class = Hyrax::CatalogSearchBuilder

    # Show gallery view
    config.view.gallery.partials = [:index_header, :index]
    config.view.slideshow.partials = [:index]

    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.default_solr_params = {
      qt: "search",
      rows: 10,
      #qf: "title_tesim description_tesim creator_tesim keyword_tesim"
      qf: "summary_general_research_area_tesim participants_targetlanguage_tesim publication_author_tesim"
    }

    # solr field configuration for document/show views
    #config.index.title_field = solr_name("title", :stored_searchable)
    config.index.summary_general_research_area_field = solr_name("summary_general_research_area", :stored_searchable)
    config.index.summary_general_research_area_field = solr_name("publication_author",              :stored_searchable)

    config.index.display_type_field = solr_name("has_model", :symbol)
    config.index.thumbnail_field = 'thumbnail_path_ss'

    #Oasis fields
    config.index.summary_general_research_area_field = solr_name('summary_general_research_area_value', :stored_searchable)
    config.index.participants_targetlanguage_field   = solr_name('participants_targetlanguage_value', :stored_searchable)

    # solr fields that will be treated as facets by the blacklight application
    # The ordering of the field names is the order of the display
    config.add_facet_field solr_name('publication_author',              :facetable), label: "Author", limit: 5
    config.add_facet_field solr_name('summary_general_research_area', :facetable), label: "Topic", limit: 5
    config.add_facet_field solr_name('summary_linguistictarget',       :facetable), label: "Language feature", limit: 5
    config.add_facet_field solr_name('participants_targetlanguage',    :facetable), label: "Language Being Learned", limit: 5
    config.add_facet_field solr_name('participants_firstlanguage',     :facetable), label: "First Language(s) of Learners", limit: 5
    config.add_facet_field solr_name('publication_date',   :facetable), label: "Date of Publication", limit: 5
    config.add_facet_field solr_name('publication_journal_name',   :facetable), label: "Journal Title(s)", limit: 5
    config.add_facet_field solr_name('participants_gender', :facetable), label: "Gender of Learners", limit: 5
    config.add_facet_field solr_name('participants_proficiency', :facetable), label: "Proficiency of Learners", limit: 5
    config.add_facet_field solr_name('participants_domain_of_use', :facetable), label: "Domains of Use", limit: 5
    config.add_facet_field solr_name('of_likely_interest_to', :facetable), label: "Of likely interest to", limit: 5

    # The generic_type isn't displayed on the facet list
    # It's used to give a label to the filter that comes from the user profile
    config.add_facet_field solr_name("generic_type", :facetable), if: false

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    #Oasis search fields
    config.add_index_field solr_name("summary_general_research_area", :stored_searchable), label: "Research Area", itemprop: 'general_research_area'
    config.add_index_field solr_name("publication_author", :stored_searchable), label: "Author of Research", itemprop: 'publication_author'
    config.add_index_field solr_name("publication_date", :stored_searchable), label: "Publication Year", itemprop: 'publication_date'
    config.add_index_field solr_name("date_uploaded", :stored_searchable), label: "Upload Date", itemprop: 'date_uploaded'
    config.add_index_field solr_name("summary_writer", :stored_searchable), label: "Summary Writer", itemprop: 'summary_writer'
    config.add_index_field solr_name("participants_targetlanguage", :stored_searchable), label: "Language Being Learned", itemprop: 'participants_targetlanguage'

    config.add_index_field solr_name("publication_title", :stored_searchable), label: "Publication Title", itemprop: 'publication_title'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    config.add_show_field solr_name("participants_targetlanguage", :stored_searchable)
    config.add_show_field solr_name("summary_general_research_area", :stored_searchable)
    config.add_show_field solr_name("publication_author", :stored_searchable)
    config.add_show_field solr_name("publication_date", :stored_searchable)

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.
    #
    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.
    config.add_search_field('all_fields', label: 'All Fields') do |field|
      all_names = config.show_fields.values.map(&:field).join(" ")
      title_name = solr_name("title", :stored_searchable)
      field.solr_parameters = {
        qf: "#{all_names} file_format_tesim all_text_timv",
        pf: title_name.to_s
      }
    end

    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.
    # creator, title, description, publisher, date_created,
    # subject, language, resource_type, format, identifier, based_near,
    # config.add_search_field('contributor') do |field|
    #   # solr_parameters hash are sent to Solr as ordinary url query params.
    #
    #   # :solr_local_parameters will be sent using Solr LocalParams
    #   # syntax, as eg {! qf=$title_qf }. This is neccesary to use
    #   # Solr parameter de-referencing like $title_qf.
    #   # See: http://wiki.apache.org/solr/LocalParams
    #   solr_name = solr_name("contributor", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('creator') do |field|
    #   solr_name = solr_name("creator", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('title') do |field|
    #   solr_name = solr_name("title", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('description') do |field|
    #   field.label = "Abstract or Summary"
    #   solr_name = solr_name("description", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('publisher') do |field|
    #   solr_name = solr_name("publisher", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('date_created') do |field|
    #   solr_name = solr_name("created", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('subject') do |field|
    #   solr_name = solr_name("subject", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('language') do |field|
    #   solr_name = solr_name("language", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('resource_type') do |field|
    #   solr_name = solr_name("resource_type", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('format') do |field|
    #   solr_name = solr_name("format", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('identifier') do |field|
    #   solr_name = solr_name("id", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('based_near') do |field|
    #   field.label = "Location"
    #   solr_name = solr_name("based_near_label", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('keyword') do |field|
    #   solr_name = solr_name("keyword", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('depositor') do |field|
    #   solr_name = solr_name("depositor", :symbol)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('rights_statement') do |field|
    #   solr_name = solr_name("rights_statement", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end
    #
    # config.add_search_field('license') do |field|
    #   solr_name = solr_name("license", :stored_searchable)
    #   field.solr_local_parameters = {
    #     qf: solr_name,
    #     pf: solr_name
    #   }
    # end

    # Add Oasis search fields
    # config.add_search_field('summary_creator') do |field|
    #   solr_name = solr_name("summary_creator", :stored_searchable)
    #   field.solr_local_parameters = {
    #       qf: solr_name,
    #       pf: solr_name
    #   }
    # end

    # config.add_search_field('summary_linguistictarget') do |field|
    #   solr_name = solr_name("summary_linguistictarget", :stored_searchable)
    #   field.solr_local_parameters = {
    #       qf: solr_name,
    #       pf: solr_name
    #   }
    # end

    config.add_search_field('summary_general_research_area') do |field|
      solr_name = solr_name("summary_general_research_area", :stored_searchable)
      field.solr_local_parameters = {
          qf: solr_name,
          pf: solr_name
      }
    end

    config.add_search_field('participants_targetlanguage') do |field|
      solr_name = solr_name("participants_targetlanguage", :stored_searchable)
      field.solr_local_parameters = {
          qf: solr_name,
          pf: solr_name
      }
    end


    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    # label is key, solr field is value
    config.add_sort_field "score desc, #{uploaded_field} desc", label: "relevance"
    config.add_sort_field "#{uploaded_field} desc", label: "date uploaded \u25BC"
    config.add_sort_field "#{uploaded_field} asc", label: "date uploaded \u25B2"
    config.add_sort_field "#{modified_field} desc", label: "date modified \u25BC"
    config.add_sort_field "#{modified_field} asc", label: "date modified \u25B2"

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5
  end

  # disable the bookmark control from displaying in gallery view
  # Hyrax doesn't show any of the default controls on the list view, so
  # this method is not called in that context.
  def render_bookmarks_control?
    false
  end
end

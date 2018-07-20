class Apa
  def self.get_surname(name)
    if name.include? ','
      return name.split(',')[0]
    end
    name
  end

  # temporary solution for https://github.com/digital-york/oasis/issues/29
  def self.get_apa_short_author_all_in_one(author_all, publication_year)
    return author_all[0].strip  + ' (' + publication_year[0] + ')'
  end

  def self.get_apa_short_html(authors, publication_year)
    if authors.nil? or publication_year.nil?
      return ''
    end

    if authors.length==1
      return get_surname(authors[0]) + ' (' + publication_year[0] + ')'
    elsif authors.length==2
      return get_surname(authors[0]) + ' & ' + get_surname(authors[1]) + ' (' + publication_year[0] + ')'
    elsif authors.length>2
      return get_surname(authors[0]) + ' et al. (' + publication_year[0] + ')'
    else
      return ''
    end
  end

  def self.get_reference_html(authors, publication_year, title, journal, authority_value=true, volume, issue, page_from, page_to)
    j_string = html_italic(journal) + '. ';
    j_string = html_italic(get_journal_string(journal)) if authority_value==true

    get_author_string(authors) +
        get_publication_year_string(publication_year) +
        get_title_string(title) +
        j_string+
        get_vol_issue_string(volume, issue) +
        get_pages_string(page_from,page_to)
  end

  def self.html_italic(s)
    if s.is_a? String
      return '<i>' + s + '</i>'
    else
      return '<i>' + s[0] + '</i>'
    end
  end

  def self.get_author_string(authors)
    # if gets a string, e.g. author_all, just return it directly, as a temporary solution for: https://github.com/digital-york/oasis/issues/29
    if authors.is_a? String
      return authors + ' '
    elsif authors.length==1
      return authors[0] + ' '
    else
      l = ''
      authors.each_with_index do |author, index|
        if index<authors.length-1
          l = l + author + ', '
        else
          l = l + '& ' + author + ' '
        end
      end
      return l
    end
  end

  def self.get_publication_year_string(year)
    if not year.nil? and not year[0].nil? and year[0]!=''
      return '(' + year[0] + '). '
    end
    ''
  end

  def self.get_title_string(title)
    if not title.nil? and not title[0].nil? and title[0]!=''
      if title[0].end_with? '.'
        return title[0] + ' '
      else
        return title[0] + '. '
      end
    end
    ''
  end

  def self.get_journal_string(journal)
    if not journal.nil? and not journal[0].nil? and journal[0]!=''
      return GenericLocalAuthorityService.id_to_label('journals',journal[0].to_i) + '. '
      #return journal[0] + '. '
    end
    ''
  end

  def self.get_vol_issue_string(vol,issue)
    if not vol.nil? and not vol[0].nil? and vol[0]!='' and not issue.nil? and not issue[0].nil? and issue[0]!=''
      return html_italic(vol[0]) + '('+issue[0]+')'+', '
    end
    ''
  end

  def self.get_pages_string(page_from,page_to)
    if not page_from.nil? and page_from!='' and not page_to.nil? and page_to!=''
      return page_from + '-'+page_to+'.'
    end
    ''
  end
end
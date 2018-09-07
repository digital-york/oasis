class Apa
  def self.get_surname(name)
    if name.include? ','
      return name.split(',')[0].strip
    else
      return name.strip
    end
  end

  def self.get_initial(name)
    if name.include? ','
      return name.split(',')[1].strip[0,1].upcase + '.'
    else
      return ''
    end
  end

  def self.format_name(name)
    return get_surname(name) + ', ' + get_initial(name)
  end

  # temporary solution for https://github.com/digital-york/oasis/issues/29
  def self.get_apa_short_author_all_in_one(author_all, publication_year)
    authors = author_all[0].strip.split('"').delete_if { |a| a=='['or a==']' or a==',' }
    authors_s = ""

    return authors[0] + ' (' + publication_year[0] + ')' if authors.length==1

    authors.each_with_index do |author, index|
      puts index
      authors_s = authors_s + author + ', ' if index<authors.length-1
      authors_s = authors_s + '& ' + author  if index==authors.length-1
    end

    return authors_s  + ' (' + publication_year[0] + ')'
    #return get_apa_short_html(author_all[0].strip, publication_year)
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

  def self.get_other_journal_string(other_journal_name, other_journal_url)
    if not other_journal_name.nil? and other_journal_name!=''
      return get_html_link(other_journal_url, other_journal_name) + ', '
    end
    ''
  end

  def self.get_reference_with_other_journal_name_html(authors, publication_year, title, other_journal_name, other_journal_url, authority_value=true, volume, issue, page_from, page_to)
    j_string = html_italic(other_journal_name) + '. ';
    j_string = html_italic(get_other_journal_string(other_journal_name, other_journal_url)) if authority_value==true
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
      return format_name(authors[0]) + ' '
    elsif authors.length==2
      return format_name(authors[0]) + ' & ' + format_name(authors[1]) + ' '
    elsif authors.length==3
      return format_name(authors[0]) + ', ' + format_name(authors[1]) + ' & ' + format_name(authors[2]) + ' '
    else
      return format_name(authors[0]) + ' et al. '
    end
  end

  def self.get_author_string_short(authors)
    # if gets a string, e.g. author_all, just return it directly, as a temporary solution for: https://github.com/digital-york/oasis/issues/29
    if authors.is_a? String
      return authors.split(',')[0] + ' '
    elsif authors.length==1
      return authors[0].split(',')[0] + ' '
    elsif authors.length==2
      return authors[0].split(',')[0] + ' & ' + authors[1].split(',')[0] + ' '
    elsif authors.length==3
      return authors[0].split(',')[0] + ', ' + authors[1].split(',')[0] + ' & ' + authors[2].split(',')[0] + ' '
    else
      return authors[0].split(',')[0] + ' et al. '
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

  def self.get_html_link(url, text, target='_blank')
    return '<a href="'+url+'" target="' + target+ '">'+text+'</a>'
  end

  def self.get_journal_string(journal)
    if not journal.nil? and not journal[0].nil? and journal[0]!=''
      if journal[0].starts_with? 'http' or journal[0].to_i <= 0
        return get_html_link(journal[0], GenericLocalAuthorityService.id_to_label('journals',journal[0])) + ', '
      else
        return get_html_link(journal[0], GenericLocalAuthorityService.id_to_label('journals',journal[0].to_i)) + ', '
      end
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
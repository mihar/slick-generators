module LayoutHelper
  def javascripts(*args)
    content_for(:head) do
     javascript_include_tag(*args)
    end
  end

  def admin_section(klass=nil, &block)
    if admin?
     concat content_tag(:div, capture(&block), :class => 'admin')
    end
  end
  
  def body_attrs
    classes = [controller.controller_name]
    { :class => classes.join(" "), :id => "#{controller.controller_name}-#{controller.action_name}" }
  end
  
  def destroy_confirmation(obj)
    if obj.respond_to? :title
     str = obj.title
    elsif obj.respond_to? :name
     str = obj.name
    else
     str = obj.id
    end

    "'#{str}' - Ste prepričani o izbrisu?"
  end

  def link_with_span_to(text, uri, options = {})
    link_to content_tag(:span, text), uri, options    
  end
  
  def link_to_back(id=nil)
    content_tag :p, link_to("Nazaj", (id) ? object_path(id) : collection_path), :class => 'backlink'
  end
    
  def link_to_mail(email)
    link_to email, "mailto:#{email}"    
  end
  
  def link_to_self(uri)
    link_to uri, uri
  end
  
  def link_to_lightbox(string, image, album = 'album', title = '')
    ret = "<a href='#{image}' rel='lightbox[#{album}]'"
    ret += " title='#{title}'" unless title.blank?
    ret += "class='lightbox'>#{string}</a>"
  end
  
  def title(_title, heading = true)
    default = "Anketa obremenitve študentov"
    title = (_title) ? "#{_title} (#{default})" : default
    content_for(:title) { title }
    
    unless not heading
      content_tag :h1, _title
    end
  end
end

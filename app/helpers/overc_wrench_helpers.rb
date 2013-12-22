module OvercWrenchHelpers

  # Render form errors in a Zurb Foundation-style
  def form_errors object
    return '' if object.errors.empty?
    
    if object.errors.count > 1
      messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved",
                        :count => object.errors.count,
                        :resource => object.class.model_name.human.downcase)

      html = <<-HTML
      <div data-alert class="alert-box secondary">
        <h5>#{sentence}</h5>
        <ol class="">#{messages}</ol>
      </div>
      HTML
    else
      html = <<-HTML
      <div data-alert class="alert-box secondary">
        <h5>#{object.errors.full_messages.first}</h5>
      </div>
      HTML
    end

    html.html_safe
  end

  # Render Google Analytics JavaScript tag
  # Ideally, should be called in application layout
  def google_analytics id
    unless Rails.configuration.consider_all_requests_local
      code = <<-ANALYTICS
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', '#{id}', 'souwrna.herokuapp.com');
        ga('send', 'pageview');
        ANALYTICS
      javascript_tag(code).html_safe
    end
  end

  # Add page title, integrates with meta_tags gem if bundled
  def page_title title, options = {}
    if defined? set_meta_tags
      set_meta_tags site: t('app.name'), title: title, reverse: true
    end
    content_for(:page_title) { title } if options[:in_page]
    content_for(:head_title) { title }
  end

  # Add Zurb Foundation flash classes 
  def flash_class(level)
    case level
    when :notice then "alert-box radius secondary"
    when :success then "alert-box radius success"
    when :error then "alert-box radius alert"
    when :alert then "alert-box radius alert"
    end
  end

  # Render LI elements and add "active" class to current page
  # TODO: use rails content_tag instead of concatenating HTML
  def link_to_nav(name, options = {}, html_options = {}, &block)
    output = '<li'.html_safe
    css = []
    css << ' class="'
    if current_page?(options)
      css << 'active'
    end
    css << '"'
    output << css.join(' ').html_safe
    output << '>'.html_safe
    output << link_to(name, options, html_options)
    output << '</li>'.html_safe
    output
  end

end
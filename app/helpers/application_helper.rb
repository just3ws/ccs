module ApplicationHelper
  def button(*args)
    if args.size == 2
      name = args[0]
      url = args[1]
      content_tag :button, :type => "button", :onclick => "window.location.href =  '#{url_for(url)}'; " do
        "#{name}"
      end
    elsif args.size == 1
      name = args[0]
      content_tag :button, :type => "button" do
        "#{name}"
      end
    end
  end

  def display_diagnostic_stylesheet?
    params["dss"] && Rails.env != "production"
  end

  def allow_markup(content)
    raw(RDiscount.new(content).to_html)
  end

  def display_name(class_name)
    class_name.gsub(/Sesja/, 'Session')
  end
end


class FlameImportService
  def initialize(host)
    @base_api_url = "#{host}/api"
  end

  def import!
    ActiveRecord::Base.transaction do
      import_applications
      import_categories
    end
  end

  private

  def api_get(resource)
    url = URI("#{@base_api_url}/#{resource}")
    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body).deep_symbolize_keys[:data]
    else
      raise "Flame Error (#{response.code}): #{response.message}"
    end
  end

  def application_icon(name)
    Icon.ransack(name_cont: name).result.first
  end

  def import_applications
    api_get(:apps).map do |flame_application|
      Application.create(
        icon: application_icon(flame_application[:name]),
        name: flame_application[:name],
        url: flame_application[:url],
        position: flame_application[:orderId]
      )
    end
  end

  def import_categories
    api_get(:categories).map do |flame_category|
      category = Category.create(
        name: flame_category[:name],
        position: flame_category[:orderId]
      )

      import_bookmarks(category, flame_category)
    end
  end

  def import_bookmarks(category, flame_category)
    flame_category[:bookmarks].map do |flame_bookmark|
      Bookmark.create(
        name: flame_bookmark[:name],
        url: flame_bookmark[:url],
        position: flame_bookmark[:orderId],
        category:
      )
    end
  end
end

module Github
  class Payload
    include ActionView::Helpers::TextHelper

    def initialize(raw_payload)
      @raw_payload = raw_payload
    end

    def data
      # TODO: error handling on not JSON or not HASH
      @data ||= Hashie::Mash.new(JSON.parse(@raw_payload))
    end

    def branch
      return "" unless data.ref
      @branch ||= data.ref.split('/').last
    end

    def pusher
      return nil unless data.pusher
      @pusher ||= User.find_by_username(data.pusher.name)
    end

    def generate_details
      # 3 commits in repo on branch
      commits_count = data.commits.try(:size) || 0
      params = { details: "#{pluralize(commits_count, 'commit')} in <a href=#{data.repository.html_url}>#{data.repository.name}</a> on #{branch}" }
      puts "params: #{params}"
      task = pusher.tasks.create(params) if pusher
    end
  end
end

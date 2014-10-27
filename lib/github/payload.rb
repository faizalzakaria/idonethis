module Github
  class Payload
    include ActionView::Helpers::TextHelper

    def initialize(raw_payload)
      @raw_payload = raw_payload
    end

    def generate_details
      params = { details: commit_details }
      task = pusher.tasks.create(params) if pusher
    end

    private

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
      @pusher ||= User.find_by_username(data.pusher.name) || User.find_by_email(data.pusher.email)
    end

    def create_link(url, text)
      "<a href=#{url}>#{text}</a>"
    end

    def branch_url
      "#{data.repository.html_url}/tree/#{data.ref}"
    end

    def commits
      @commits = data.commits || []
    end

    def commit_details
      # commit.message -- commit in repo on branch
      str = "<b>#{pluralize(data.commits.try(:size), 'commit')} in <a href=#{data.repository.html_url}>#{data.repository.name}</a> on #{branch} </b></br>"
      commits.each do |commit|
        str << "#{commit.message} -- #{create_link(commit.url, 'commit')} in #{create_link(data.repository.html_url, data.repository.name)} on #{create_link(branch_url, branch)}</br>"
      end
      str
    end
  end
end

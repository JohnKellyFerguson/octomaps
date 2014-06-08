module Github
  class Repository < APIConnection
    attr_reader :full_repo_name

    def initialize(full_repo_name)
      @full_repo_name = full_repo_name
    end

    def attributes
      @attributes ||= client.repo(full_repo_name).to_h rescue {}
    end

    [
      :full_name,
      :id,
      :name,
      :description,
      :homepage,
      :size,
      :fork,
      :forks_count,
      :stargazers_count,
      :watchers_count,
      :subscribers_count,
      :created_at,
      :updated_at,
      :pushed_at
    ].each do |key|
      define_method(key) { attributes.fetch(key) }
    end

    def owner
      @owner ||= Github::Owner.new(attributes.fetch(:owner))
    end

    def contributors
      @contributors ||=
        client.contribs(full_name).map do |contrib_attrs|
          Github::Contributor.new(contrib_attrs)
        end
    end
  end
end

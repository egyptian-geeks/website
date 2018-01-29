class ImportPostsService < ApplicationService
  def initialize(posts_directory)
    @posts_directory = posts_directory
  end

  def call
    raise Errno::ENOENT unless File.exist?(posts_directory)
    import_posts
  end

  private

  attr_reader :posts_directory

  def import_posts
    files_pattern = File.join(posts_directory, '*.yml')
    files = Dir.glob(files_pattern)
    files_count = files.count

    puts "=> Importing #{files_count} Post"

    files.each_with_index do |file, i|
      content = YAML.load_file(file)
      Rails.logger.warn("Importing: #{file}")
      import_post(content)
      # Progress Bar
      printf("\r[%-50s] #{i + 1}/#{files_count} ", '=' * ((i+1.0) / files_count * 50))
    end

    puts "\n"
  end

  def import_post(content)
    post = create_post(content)
    import_failure(post) unless post.persisted?
  end

  def create_post(content)
    Post.find_or_create_by(fid: content['id']) do |post|
      post.fid = content['id']
      post.message = content['message']
      post.link = content['link']
      post.type = content['type'].capitalize
      post.created_at = content['created_time']
      post.updated_at = content['updated_time']
      post.permalink_url = content['permalink_url']
      post.user = create_user(content['from'])
    end
  end

  def create_user(content)
    User.find_or_create_by(fid: content['id']) do |user|
      user.fid = content['id']
      user.name = content['name']
    end
  end

  def import_failure(post)
    Rails.logger.error(post.errors.full_messages)
    exit(1)
  end
end

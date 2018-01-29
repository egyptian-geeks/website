class ImportDirectoryService < ApplicationService
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
      if i % 100 == 0
        printf("\r[%-50s] #{i + 1}/#{files_count} ", '=' * ((i+1.0) / files_count * 50))
      end
    end

    puts "\n"
  end

  def import_post(content)
    post = ImportPostService.call(content)
    failure(post) unless post.persisted?
  end

  def failure(post)
    Rails.logger.error(post.errors.full_messages)
    exit(1)
  end
end

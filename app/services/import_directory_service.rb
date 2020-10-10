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

    index = 0
    files.each_slice(1000) do |files_slice|
      Post.transaction do
        files_slice.each do |file|
          content = YAML.load_file(file)
          Rails.logger.warn("Importing: #{file}")
          import_post(content)

          # Progress Bar
          if index % 100 == 0 || index + 1 == files_count
            printf("\r[%-50s] #{index + 1}/#{files_count} ", '=' * ((index+1.0) / files_count * 50))
          end

          index += 1
        end
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

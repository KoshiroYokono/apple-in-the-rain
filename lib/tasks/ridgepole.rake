
class RidgepoleRunner
  attr_reader :env, :dry

  def initialize(env:, dry:)
    @env = env
    @dry = dry
  end

  def self.dryrun(env:)
    new(env: env, dry: true).apply
  end

  def self.apply(env:)
    new(env: env, dry: false).apply
  end

  def apply

    Open3.popen3(
      "bundle exec ridgepole -E #{env} -c config/database.yml --apply#{" --dry-run" if dry}"
    ) do |_i, stdout, stderr|
      notification_block = []
      while(stdout_str = stdout.gets || stderr_str = stderr.gets) do
        unless stdout_str.nil?
          puts stdout_str
          if stdout_str.strip.empty?
            notification_block = []
          elsif stdout_str.match?(/\A-- .+/)
            notification_block = []
            notification_block << stdout_str
          else
            notification_block << stdout_str
          end
        end

        if !stderr_str.nil? && !stderr_str.empty?
          stderr_str.strip!
          puts stderr_str
        end
      end
    end
  end
end

namespace :ridgepole do
  namespace :dryrun do
    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run' with notification."
    task :test do
      RidgepoleRunner.dryrun(env: :test)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run' with notification."
    task :development do
      RidgepoleRunner.dryrun(env: :development)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run' with notification."
    task :production do
      RidgepoleRunner.dryrun(env: :production)
    end
  end

  namespace :apply do
    desc "'Run ridgepole -E test -c config/database.yml --apply' with notification."
    task :test do
      RidgepoleRunner.apply(env: :test)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply' with notification."
    task :development do
      RidgepoleRunner.apply(env: :development)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply' with notification."
    task :production do
      RidgepoleRunner.apply(env: :production)
    end
  end
end

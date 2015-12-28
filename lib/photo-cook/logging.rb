module PhotoCook
  class Logger
    def initialize(logger)
      @logger = logger
    end

    def info(msg)
      @logger.info(msg)
    end

    def matched_resize_uri(uri)
      info %{
[PhotoCook] Matched resize URI.
  URI:          #{uri}
      }
    end

    def performed_resize(photo, w, h, px_ratio, crop, msec)
      info %{
[PhotoCook] Performed resize.
  Source file:  #{photo.source_path}
  Resized file: #{photo.resized_path}
  Width:        #{w == 0 ? 'auto': "#{w}px"}
  Height:       #{h == 0 ? 'auto': "#{h}px"}
  Crop:         #{crop ? 'yes' : 'no'}
  Pixel ratio:  #{px_ratio}
  Completed in: #{msec.round(1)}ms
      }
    end

    def will_symlink_cache_dir(cmd)
      info %{
[PhotoCook] Will symlink cache directory.
  Command:      #{cmd}
      }
    end

    def symlink_cache_dir_success
      info %{
[PhotoCook] Successfully symlink cache directory.
      }
    end

    def symlink_cache_dir_failure
      info %{
[PhotoCook] Failed to symlink cache directory.
      }
    end

    def will_perform_optimization(path)
      info %{
[PhotoCook] Will perform optimization.
  File path:     #{path}
      }
    end

    def performed_optimization(path, original_size, new_size)
      diff = original_size - new_size
      info %{
[PhotoCook] Performed optimization.
  File path:     #{path}
  Original size: #{PhotoCook.format_size(original_size)}
  New size:      #{PhotoCook.format_size(new_size)}
  Saved:         #{diff} bytes / #{PhotoCook.format_size(diff)} / #{(diff / original_size.to_f * 100.0).round(2)}%
      }
    end

    def no_optimization_performed(path)
      info %{
[PhotoCook] No optimization performed.
  File path:     #{path}
      }
    end
  end

  class STDOut
    def info(msg)
      print(msg)
    end
  end

  def self.logger
    @logger ||= Logger.new(rails_env? ? Rails.logger : STDOut.new)
  end
end
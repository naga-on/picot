class Volume < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :title, :pdf_file, :cover

  def thumbnail
    self.img_dir.sub("#{Rails.root}/public", "") + "/%03d.png" % self.cover
  end

  def pdf_link
    self.pdf_file.sub("#{Rails.root}/public", "")
  end

  def set_img
    tmp = "#{Rails.root}/tmp/_tmp.pdf"
    begin
      File.open(tmp, "w") do |f|
        f.puts self.pdf_file.read.force_encoding("utf-8")
      end
      path = "#{Rails.root}/public/data/%04d/img" % get_id
      `#{convert} #{tmp} #{path}/%03d.png`
    rescue
      return nil
    end
    path
  end

  def set_pdf
    path = "#{Rails.root}/public/data/%04d" % get_id
    pdf_file = path + "/volume.pdf"
    convert_pdf(pdf_file, path + "/img", path + "/img_tmp")
    pdf_file
  end

  def mkdir
    path = "#{Rails.root}/public/data/%04d" % get_id
    Dir::mkdir(path)
    Dir::mkdir(path + "/img")
    Dir::mkdir(path + "/img_tmp")
  end

  def rmdir
    path = "#{Rails.root}/public/data/%04d" % get_id
    `rm -rf #{path}`
  end

  private
  def get_id
    id = 1
    id = Volume.last.id+1 if Volume.last.present?
    id
  end

  def convert_pdf(pdf_file, img_dir, tmp_dir)
    images = `ls #{img_dir}`.split.map {|i| img_dir + "/" + i}
    page = 0
    com_file = "#{tmp_dir}/%03d.png"
    while images.present? do
      w1, h1 = `identify -format "%w %h" #{images[0]}`.split.map {|a| a.to_i}
      w2, h2 = `identify -format "%w %h" #{images[1]}`.split.map {|a| a.to_i}

      if images[1].nil?
        `#{convert} #{images[0]} #{com_file % page}`
        break
      end

      if h1 < w1
        `#{convert} #{images[0]} #{com_file % page}`
      elsif h2 < w2
        `#{convert} #{images[0]} #{com_file % page}`
        `#{convert} #{images[1]} #{com_file % (page+1)}`
        images.shift
        page += 1
      else
        `#{convert} +append "#{images[1]}" "#{images[0]}" "#{com_file % page}"`
        images.shift
      end
      page += 1
      images.shift
    end
    `#{convert} #{tmp_dir}/* #{pdf_file}`
  end

  def convert
    "MAGICK_TMPDIR=#{Rails.root}/tmp convert"
  end
end


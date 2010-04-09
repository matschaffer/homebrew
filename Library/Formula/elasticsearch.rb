require 'formula'

class Elasticsearch < Formula
  url 'http://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-0.5.1.zip'

  homepage 'http://www.elasticsearch.com'
  md5 'c438c0d18bef8d2efd2d801fa872a3fa'

  def install
    prefix.install %w[bin conf lib work]
    FileUtils.rm_f Dir["#{bin}/*.bat"]
  end
end

ROOT = File.join(File.expand_path(File.dirname(__FILE__)), "..")

file_cache_path File.join(ROOT, ".chef", "cache")
cache_options(:path => File.join(ROOT, ".chef", "checksums"), :skip_expires => true)
cookbook_path [File.join(ROOT, "cookbooks"), File.join(ROOT, "site-cookbooks")]
node_path File.join(ROOT, "nodes")
knife[:berkshelf_path] = File.join(ROOT, "cookbooks")

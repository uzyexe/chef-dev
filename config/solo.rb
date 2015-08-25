ROOT = File.join(File.expand_path(File.dirname(__FILE__)), "..")

file_cache_path File.join(ROOT, ".chef", "cache")
file_backup_path File.join(ROOT, ".chef", "backup")

cache_options(:path => File.join(ROOT, ".chef", "checksums"), :skip_expires => true)

cookbook_path [File.join(ROOT, "cookbooks"), File.join(ROOT, "site-cookbooks")]
role_path File.join(ROOT, "roles")
node_path File.join(ROOT, "nodes")
data_bag_path File.join(ROOT, "data_bags")
#encrypted_data_bag_secret "data_bag_key"

client_key File.join(ROOT, ".chef", "user.pem")
knife[:berkshelf_path] = File.join(ROOT, "cookbooks")

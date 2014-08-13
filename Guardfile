guard :elixir do
  watch(%r{^config/(.+)\.ex$})        {"test"}
  watch(%r{^test/(.*)_test\.exs})
  watch(%r{^lib/(.+)\.ex$})           {|m| "test/#{m[1]}_test.exs"}
  watch(%r{^web/(.+)\.ex$})           {"test"}
  watch(%r{^lib/(.+)\.ex$})           {|m| "test/doc_test.exs"}
  watch(%r{^test/test_helper.exs$})   {"test"}
end

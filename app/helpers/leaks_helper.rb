module LeaksHelper
  def display_leak_content(leak)
    format('<pre><code class="%s">%s</code></pre>', File.extname(leak.file).delete('.'), leak.content).html_safe
   end
end

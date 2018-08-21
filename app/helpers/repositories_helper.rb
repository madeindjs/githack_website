module RepositoriesHelper
  def css_class_color(repository)
    if repository.unsafe_leaks.count > 0
      'text-danger'
    elsif repository.unchecked_leaks.count == 0
      'text-muted'
    end
  end
end

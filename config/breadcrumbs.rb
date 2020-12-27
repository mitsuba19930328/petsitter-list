

# crumb :root do
#   link "Home", root_path
# end
#
# crumb :petsitter do
#   link "ペットシッター一覧", petsitters_path
#   parent :root, root
# end
#
# crumb :petsitter do |petsitter|
#   link "ペットシッターの名前", petsitters_path(petsitter)
#   parent :petsitter, petsitter
# end

# ユーザー詳細
# crumb :user do
#   link "ユーザー詳細", users_path
#   parent :petsitters
# end

# # ペットシッター詳細
# crumb :petsitterProfile do
# link "ペットシッター詳細", petsitters_path
# parent :petsitters
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
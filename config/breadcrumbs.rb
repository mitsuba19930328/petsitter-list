
crumb :root do
  link "ペットシッターリスト", root_path
end

  crumb :petsitters do |petsitter|
    link "全てのペットシッター", petsitters_path
    parent :root
  end

    crumb :petsitter do |petsitter|
      petsitter = Petsitter.find(params[:id])
      link petsitter.name, petsitter_path(petsitter.id)
      parent :petsitters
    end

  crumb :user do |user|
    user = User.find(params[:id])
    link "#{user.name}さん のマイページ", user_path(user.id)
    parent :root
  end

    crumb :user_edit do |user|
      user = current_user
      link "ユーザ情報編集", edit_user_path(user.id)
      parent :user
    end

    crumb :user_histories do |user|
      user = User.find(params[:id])
      link "行ったお店一覧", user_histories_path(user.id)
      parent :user
    end

    crumb :user_clips do |user|
      user = User.find(params[:id])
      link "保存済み一覧", user_clips_path(user.id)
      parent :user
    end

# crumb :archives do |archives,year|
#   link "Archives", article_archive_path(archives)
#   parent :articles
# end

# crumb :category do |category|
#   link "Category"
#   link category.cat_name, categories_path(category)
#   parent :articles
# end








# crumb :petsitters do
#   link "全てのペットシッター", petsitters_path
#   parent :root
# end
#
# # 子カテゴリーのパンくず
# crumb :child_petsitter do |petsitter|
#   petsitter = Petsitter.find(params[:id])
#   # 表示しているページが子カテゴリーの一覧ページの場合
#   if petsitter.has_children?
#     link "#{petsitter.name}", petsitter_path(petsitter)
#     parent :petsitters
#
#     # 表示しているページが孫カテゴリーの一覧ページの場合
#   else
#     link "#{petsitter.parent.name}", category_path(category.parent)
#     parent :petsitters
#   end
# end

# # 親カテゴリーのパンくず
# crumb :petsitter_show do |petsitter|
#   petsitter = Petsitter.find(params[:id])
#   link "#{petsitter.name}", petsitter_path(petsitter.id)
#   parent :petsitters
# end

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
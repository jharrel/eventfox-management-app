class Search < ApplicationRecord

    def search_projects

        projects = Projects.all

        project = project.where(["project LIKE ?", "%#{project}%"]) if project.present?
        project = project.where(["task LIKE ?", "%#{task}%"]) if task.present?

    end



end

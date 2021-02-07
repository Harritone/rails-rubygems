module CoursesHelper
  def enrollment_button(course)
    if current_user
      if course.user == current_user
        link_to 'It is your course. View analitic', course_path(course)
      elsif course.enrollments.where(user: current_user).any?
        link_to 'Go to course', course_path(course), class: 'btn btn-sm btn-outline-success'
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: 'btn btn-sm btn-outline-primary'
      else
        link_to 'Free', new_course_enrollment_path(course), class: 'btn btn-sm btn-outline-primary'
      end 
    else
      link_to 'Check price', course_path(course), class: 'btn btn-sm btn-outline-success'
    end
  end

  def review_button(course)
    user_course = course.enrollments.where(user: current_user)
    if current_user
      if user_course.any?
        if user_course.pending_review.any?
          link_to 'Add a review', edit_enrollment_path(user_course.first), class: 'btn btn-sm btn-outline-warning'
        else
          # raw("<p>You've left a review</p>")
          # link_to 'Review', enrollment_path(user_course.first)
          link_to enrollment_path(user_course.first) do
            "<i class='text-warning fa fa-star'></i>".html_safe + " " +
            "<i class='fa fa-check'></i>".html_safe + " " +
            'Thanks for reviewing! Your Review'
          end
        end
      end
    end
  end
end

module ApplicationHelper
	def show_login(user)
		if user
			link_to user.email, logout_path
		else
			link_to "Login", login_path
		end
	end

	def create_navlink(name, url)
		# <li class="active"><a href="/home">Home</a></li>
      		cname = name.downcase
      		is_active = cname == controller.controller_name
      		active = is_active ? 'active' : ''
      		link = link_to(name, url)
		"<li class=\"#{active}\">#{link}</li>".html_safe 
	end



end

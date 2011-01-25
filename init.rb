require 'redmine'

Redmine::Plugin.register :redmine_hcard do
  name 'Redmine Hcard Macro plugin'
  author 'Courtney Palit'
  description 'This is a plugin for Redmine that adds a {{hcard(username)}} macro to show user contact details in hcard format.'
  version '0.0.1'

  Redmine::WikiFormatting::Macros.register do
    desc "Insert a hCard for a user. Example:\n\n !{{hcard(foo)}}\n\nThe user login is not case sensitive."
    macro :hcard do |obj, args|
      users = User.find :all, :conditions => ARCondition.new(["login = ?", args.first]).conditions
      if users.empty?
        "Login #{args.first} not found"
      else
  			m = HcardHelper::Macro.new(self)
  			m.render
        
        user = users.first
        title = user.custom_values.select{|cv| cv.custom_field.name.casecmp("title") == 0}.first.value rescue nil
        org = user.custom_values.select{|cv| cv.custom_field.name.casecmp("organization") == 0}.first.value rescue nil
        schedule = user.custom_values.select{|cv| cv.custom_field.name.casecmp("schedule") == 0}.first.value rescue nil
        vacation = user.custom_values.select{|cv| cv.custom_field.name.casecmp("vacation") == 0}.first.value rescue nil
        office = user.custom_values.select{|cv| cv.custom_field.name.casecmp("office") == 0}.first.value rescue nil
        mobile = user.custom_values.select{|cv| cv.custom_field.name.casecmp("mobile") == 0}.first.value rescue nil
        aim = user.custom_values.select{|cv| cv.custom_field.name.casecmp("aim") == 0}.first.value rescue nil
        yim = user.custom_values.select{|cv| cv.custom_field.name.casecmp("yim") == 0}.first.value rescue nil
        msn = user.custom_values.select{|cv| cv.custom_field.name.casecmp("msn") == 0}.first.value rescue nil
        gtalk = user.custom_values.select{|cv| cv.custom_field.name.casecmp("gtalk") == 0}.first.value rescue nil
        skype = user.custom_values.select{|cv| cv.custom_field.name.casecmp("skype") == 0}.first.value rescue nil
        "<div id=\"hcard-#{user.login}\" class=\"vcard\"><span class=\"fn\">#{user.firstname} #{user.lastname}</span>" +
        (title.nil? || title.empty? ? "" : ", <span class=\"title\">#{title}</span>") +
        (org.nil? || org.empty? ? "" : "<div class=\"org\">#{org}</div>") +
        "<a class=\"email\" href=\"mailto:#{user.mail}\">#{user.mail}</a>" +
        (office.nil? || office.empty? ? "" : "<div class=\"tel\"><span class=\"type\">office</span>:&nbsp;<span class=\"value\">#{office}</span></div>") +
        (mobile.nil? || mobile.empty? ? "" : "<div class=\"tel\"><span class=\"type\">mobile</span>:&nbsp;<span class=\"value\">#{mobile}</span></div>") +
        (aim.nil? || aim.empty? ? "" : "<a class=\"url\" href=\"aim:goim?screenname=#{aim}\">AIM</a>") +
        (yim.nil? || yim.empty? ? "" : "<a class=\"url\" href=\"ymsgr:sendIM?#{yim}\">YIM</a>") +
        (msn.nil? || msn.empty? ? "" : "<a class=\"url\" href=\"msnim:chat?contact=#{msn}\">MSN</a>") +
        (gtalk.nil? || gtalk.empty? ? "" : "<a class=\"url\" href=\"xmpp:#{gtalk}\">GTalk</a>") +
        (skype.nil? || skype.empty? ? "" : "<a class=\"url\" href=\"skype:#{skype}\">Skype</a>") +
        (schedule.nil? || schedule.empty? ? "" : "<div class=\"schedule\">schedule: #{schedule}</div>") +
        (vacation.nil? || vacation.empty? ? "" : "<div class=\"vacation\">vacation: #{vacation}</div>") +
        "</div>"
      end
    end
  end
end


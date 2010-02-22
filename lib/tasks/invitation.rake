namespace :invitation do
  desc "Send out invitations"
  task :send, :count, :needs => :environment do |t, args|
    count = args[:count].to_i
    if count.blank? || count == 0
      puts "You have to tell me how many invitations to send. (e.g. rake invitation:send[10])"
    else
      invitations = Invitation.find(:all, :conditions => { :sent_at => nil }, :order => 'created_at', :limit => count)
      if invitations.empty?
        puts "No invitations to send"
      else
        puts "Sending #{invitations.length} invitations..."
        invitations.each do |invitation|
          Mailer.deliver_invitation(invitation, [ROOT, "/register/", invitation.token].join)
        end
      end
    end
  end
end
class EventMailer < ApplicationMailer
  default from: "christhp@yopmail.com"

  def attendance_email(event, organizer)
    @organizer = organizer
    @event = event

    @url = "https://calm-ravine-71504.herokuapp.com/"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @organizer.email, subject: "Quelqu'un participe a votre putain d'event")
  end
end
